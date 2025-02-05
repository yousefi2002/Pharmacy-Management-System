import 'package:fargard_pharmacy_management_system/providers/crud_for_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../models/customers.dart';
import 'customer_regis_page.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({super.key});

  @override
  _CustomerListPageState createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  final TextEditingController _searchController = TextEditingController();
  void goBack() {
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<CustomerProvider>(context, listen: false).fetchCustomers();
      });
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.backspace): GoBackIntent(),
      },
      child: Actions(
        actions:{
          GoBackIntent: CallbackAction<GoBackIntent>(onInvoke: (intent) =>goBack ()),
        },
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Text(AppLocalizations.of(context)!.customers, style: const TextStyle(fontSize: 30),),
                const Expanded(child: SizedBox()),
                // Text Search Bar
                Expanded(
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.search,
                      hintStyle: const TextStyle(color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white30, // Semi-transparent background
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                        )
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomerPage(Customer(null, '', null, '', null)),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(AppLocalizations.of(context)!.register_customer),
                    )),
              ],
            ),
          ),
          body: Consumer<CustomerProvider>(
            builder: (context,value,child) {
              final date = value.customer;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: PaginatedDataTable(
                      showCheckboxColumn: true,
                      showEmptyRows: true,
                      source: MyDate(date, context),
                      columns: [
                        const DataColumn(label: Text("ID",)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.customer_name)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.contact_number)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.address)),
                        const DataColumn(label: Text("")),
                      ],
                      columnSpacing: 50,
                      horizontalMargin: 40,
                      showFirstLastButtons: true,
                    ),
                  ),
                ),
              );
            }
            ),
        ),
      ),
    );
  }
}

class MyDate extends DataTableSource {
  var value;
  final BuildContext context;
  MyDate(this.value,this.context);

  @override
  DataRow getRow(int index) {
    Customer customer = value[index];
    return DataRow(cells: [
      DataCell(Text("${index+1}")),
      DataCell(Text(customer.name)),
      DataCell(Text(customer.contactNumber)),
      DataCell(Text(customer.email)),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                  context:context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text(AppLocalizations.of(context)!.delete),
                      content: Text(AppLocalizations.of(context)!.confirmDelete),
                      actions: [
                        TextButton(onPressed:(){
                          Navigator.of(context).pop();
                        }, child: Text(AppLocalizations.of(context)!.no)),
                        TextButton(onPressed: (){
                          Provider.of<CustomerProvider>(context,listen: false).
                          deleteCustomer(customer.id??0);
                          Navigator.of(context).pop();
                        }, child: Text(AppLocalizations.of(context)!.delete))
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.delete, color: Colors.red,),),
          IconButton(
            onPressed: () async{
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder:(context) =>CustomerPage(customer),));
            },
            icon: const Icon(
              Icons.edit_note_outlined,
              color: Colors.blue,
            ),
          ),
        ],
      )),
    ],
      color: WidgetStateProperty.all(Colors.grey.shade200)
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => value.length;

  @override
  int get selectedRowCount => 0;
}
