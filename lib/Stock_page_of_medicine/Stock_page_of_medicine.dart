import 'package:fargard_pharmacy_management_system/Stock_page_of_medicine/crud_for_stock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class StockPageOfMedicine extends StatefulWidget {
  const StockPageOfMedicine({super.key});

  @override
  _StockPageOfMedicineState createState() => _StockPageOfMedicineState();
}

class _StockPageOfMedicineState extends State<StockPageOfMedicine> {

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<StockProvider>(context, listen: false).fetchStocks();
    });
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<StockProvider>(
        builder: (context, value, child) {
          final data = value.stock;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: PaginatedDataTable(
                      source: MyData(data, context),
                      columns: [
                        const DataColumn(label: Text("#")),
                        DataColumn(label: Text(AppLocalizations.of(context)!.medicine_name)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.inventory)),
                       ],
                      header: Center(child: Text(AppLocalizations.of(context)!.warehouse)),
                      columnSpacing: 140,
                      horizontalMargin: 80,
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
      DataCell(Text(data.pricePerUnit.toString())),
      DataCell(Text(data.quantity.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => value.length;

  @override
  int get selectedRowCount => 0;
}
