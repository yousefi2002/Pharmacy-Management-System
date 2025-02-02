import 'package:fargard_pharmacy_management_system/providers/crud_for_sales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: PaginatedDataTable(
                  showCheckboxColumn: true,
                  showEmptyRows: true,
                  source: MyData(value.sales, context),
                  columns: [
                    const DataColumn(label: Text("#")),
                    DataColumn(label: Text(AppLocalizations.of(context)!.customer_name)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.sales_invoices)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.date)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.price)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.discount)),
                    const DataColumn(label: Text("")),
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
  var value;
  final BuildContext context;
  MyData(this.value, this.context);

  @override
  DataRow getRow(int index) {
    final salesValue = value[index];
    return DataRow(cells: [
      DataCell(Text(salesValue.id.toString())),
      DataCell(Text(salesValue.salesCustomerId.toString())),
      DataCell(Text(salesValue.salesUserId.toString())),
      DataCell(Text(salesValue.date)),
      DataCell(Text(salesValue.price.toString())),
      DataCell(Text(salesValue.discount.toString())),
      DataCell(Row(children: [
          IconButton(onPressed:(){}, icon: const Icon(Icons.delete,color: Colors.red,),),
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
