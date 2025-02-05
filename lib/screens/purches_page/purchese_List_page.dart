import 'package:fargard_pharmacy_management_system/models/purchase_supplier.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_supplier.dart';
import 'package:fargard_pharmacy_management_system/screens/suppliers/suppliers_list.dart';
import 'package:fargard_pharmacy_management_system/utilities/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../models/purchases.dart';
import '../../models/suppliers.dart';
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
                onChanged: (value){
                  Provider.of<PurchasesProvider>(context, listen: false).searchPurchase(value);
                },
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
                        builder: (context) => const PurchasePage(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    AppLocalizations.of(context)!.add_medicine,
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
          final purchaseData = value.purchases;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: SingleChildScrollView(
                      child: PaginatedDataTable(
                        showCheckboxColumn: true,
                        showEmptyRows: true,
                        source: MyData(purchaseData, context),
                        columns: [
                          DataColumn(label: Text(AppLocalizations.of(context)!.id)),
                          DataColumn(label: Text(AppLocalizations.of(context)!.supplier)),
                          DataColumn(label: Text(AppLocalizations.of(context)!.total_price)),
                          DataColumn(label: Text(AppLocalizations.of(context)!.date)),
                          DataColumn(label: Text(AppLocalizations.of(context)!.actions)),
                        ],
                        columnSpacing: 50,
                        horizontalMargin: 20,
                        showFirstLastButtons: true,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MyData extends DataTableSource {
  List<PurchaseWithSupplier> purchases;
  final BuildContext context;
  MyData(this.purchases, this.context);

  @override
  DataRow getRow(int index) {
    final purchase = purchases[index];
    return DataRow(cells: [
      DataCell(Text('${index + 1}')),
      DataCell(Text(purchase.supplierName)),
      DataCell(Text(purchase.totalPrice.toString())),
      DataCell(Text(purchase.date.toString())),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(AppLocalizations.of(context)!.delete),
                    content: Text(AppLocalizations.of(context)!.confirmDelete),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(AppLocalizations.of(context)!.no),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<PurchasesProvider>(context, listen: false).deletePurchases(purchase.purchaseId ?? 0);
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.delete),
                      ),
                    ],
                  );
                },
              );
            }, icon: const Icon(Icons.delete,color: Colors.red,),),
          IconButton(onPressed:(){}, icon: const Icon(Icons.edit_note_outlined,color: Colors.blue,),),
        ],
      )),
    ],
        color: WidgetStateProperty.all(Colors.grey.shade200)
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => purchases.length;

  @override
  int get selectedRowCount => 0;
}
