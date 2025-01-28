import 'package:fargard_pharmacy_management_system/purches_page/Purchase_page.dart';
import 'package:fargard_pharmacy_management_system/purches_page/crud_for_purchase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class PurchaseListPage extends StatefulWidget {
  const PurchaseListPage({super.key});

  @override
  _PurchaseListPageState createState() => _PurchaseListPageState();
}

class _PurchaseListPageState extends State<PurchaseListPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<PurchasesProvider>(context, listen: false).fetchPurchases();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.purchase_invoice, style: const TextStyle(fontSize: 30),),
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
                        builder: (context) => PurchasePage(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "Add Customer",
                  ),
                )),
          ],
        ),
      ),
      body: Consumer<PurchasesProvider>(
        builder: ( context, value, child) {
          final data = value.purchases;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: PaginatedDataTable(
                      showCheckboxColumn: true,
                      showEmptyRows: true,
                      source: MyData(data, context),
                      columns: [
                        const DataColumn(label: Text("#")),
                        DataColumn(label: Text(AppLocalizations.of(context)!.account)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.contact_number)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.date)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.invoice_number)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.total_price)),
                        const DataColumn(label: Text("")),
                      ],
                      columnSpacing: 120,
                      horizontalMargin: 40,
                      showFirstLastButtons: true,
                    ),
                  ),
                ),
              ],
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
    final data = value[index];
    return DataRow(cells: [
      DataCell(Text(data.medicineId.toString())),
      DataCell(Text(data.supplierId.toString())),
      DataCell(Text(data.quantity.toString())),
      DataCell(Text(data.date)),
      DataCell(Text(data.pricePerUnit.toString())),
      DataCell(Text(data.totalPrice.toString())),
      DataCell(Row(
        children: [
          IconButton(onPressed:(){}, icon:Icon(Icons.delete,color: Colors.red,),),
          IconButton(onPressed:(){}, icon:Icon(Icons.edit_note_outlined,color: Colors.blue,),),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => value.length;

  @override
  int get selectedRowCount => 0;
}
