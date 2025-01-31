import 'package:fargard_pharmacy_management_system/providers/crud_for_supplier.dart';
import 'package:fargard_pharmacy_management_system/screens/suppliers/suppliers_list.dart';
import 'package:fargard_pharmacy_management_system/utilities/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/crud_for_purchase.dart';
import 'Purchase_page.dart';

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
      Provider.of<SupplierProvider>(context, listen: false).fetchSuppliers();
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
                    AppLocalizations.of(context)!.register_medicine,
                  ),
                )),
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
                      builder: (context) => const SuppliersList()),);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(AppLocalizations.of(context)!.suppliers),
              ),),
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
                        DataColumn(label: Text(AppLocalizations.of(context)!.id)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.date)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.total_price)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.supplier)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.created_at)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.updated_at)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.actions)),
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
    final purchase = value[index];
    return DataRow(cells: [
      DataCell(Text(purchase.id.toString())),
      DataCell(Text(purchase.date.toString())),
      DataCell(Text(purchase.totalPrice.toString())),
      DataCell(Text(purchase.supplierId.toString())),
      DataCell(Text(formatLocalTime(purchase.createdAt))),
      DataCell(Text(formatLocalTime(purchase.updatedAt))),
      DataCell(Row(
        children: [
          IconButton(onPressed:(){}, icon:Icon(Icons.delete,color: Colors.red,),),
          IconButton(onPressed:(){}, icon:Icon(Icons.edit_note_outlined,color: Colors.blue,),),
        ],
      )),
    ],
        color: MaterialStateProperty.all(Colors.grey.shade200)
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => value.length;

  @override
  int get selectedRowCount => 0;
}
