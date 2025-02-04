import 'package:fargard_pharmacy_management_system/models/sales_with_customer_and_user.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_sales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../models/sales.dart';
import 'sales_page.dart';

class SalesListPage extends StatefulWidget {
  const SalesListPage({super.key});

  @override
  _SalesListPageState createState() => _SalesListPageState();
}

class _SalesListPageState extends State<SalesListPage> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<SalesProvider>(context, listen: false).fetchSales();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.sales_invoices, style: const TextStyle(fontSize: 30),),
            const Expanded(child: SizedBox()),
            // Text Search Bar
            Expanded(
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
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
                onChanged: (value){
                  Provider.of<SalesProvider>(context, listen: false).searchSales(value);
                },
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
                        builder: (context) => SalesPage(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "Add Sales",
                  ),
                )),
          ],
        ),
      ),
      body: Consumer<SalesProvider>(
        builder: ( context, value, child) {
          final data = value.sales;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: PaginatedDataTable(
                  showCheckboxColumn: true,
                  showEmptyRows: true,
                  source: MyData(data, context),
                  columns: [
                    const DataColumn(label: Text("#")),
                    DataColumn(label: Text(AppLocalizations.of(context)!.customer_name)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.invoice_number)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.username)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.date)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.price)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.discount)),
                     DataColumn(label: Text(AppLocalizations.of(context)!.actions)),
                  ],
                  columnSpacing: 50,
                  horizontalMargin: 40,
                  showFirstLastButtons: true,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyData extends DataTableSource {
  List<SalesWithCustomerAndUser> value;
  final BuildContext context;
  MyData(this.value, this.context);

  @override
  DataRow getRow(int index) {
    final salesValue = value[index];
    return DataRow(cells: [
      DataCell(Text('${index + 1}')),
      DataCell(Text(salesValue.customerName)),
      DataCell(Text(salesValue.salesInvoiceId.toString())),
      DataCell(Text(salesValue.userName.toString())),
      DataCell(Text(salesValue.date)),
      DataCell(Text(salesValue.price.toString())),
      DataCell(Text(salesValue.discount.toString())),
      DataCell(Row(children: [
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title:  Text(AppLocalizations.of(context)!.delete),
                  content:  Text(AppLocalizations.of(context)!.delete_item),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child:  Text(AppLocalizations.of(context)!.cancel),
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<SalesProvider>(context, listen: false)
                            .deleteSales(salesValue.salesId ?? 0);
                        Navigator.of(context).pop();
                      },
                      child: Text(AppLocalizations.of(context)!.accept),
                    ),
                  ],
                );
              },
            );
          },
        ),
          IconButton(onPressed:(){}, icon: const Icon(Icons.edit_note_outlined,color: Colors.blue,),),
        ],
      ),
     ),
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
