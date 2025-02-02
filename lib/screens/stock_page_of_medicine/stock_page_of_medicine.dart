import 'package:fargard_pharmacy_management_system/models/medicines.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../models/stocks.dart';
import '../../providers/crud_for_stock.dart';

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
      Provider.of<StockProvider>(context, listen: false).fetchMedicinesNameFromStock();
    });
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<StockProvider>(
        builder: (context, stockProvider, child) {
          final stockList = stockProvider.stock;
          final medicineNameList = stockProvider.medicinesName;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: PaginatedDataTable(
                      source: MyData(stockList,medicineNameList, context),
                      columns: [
                        const DataColumn(label: Text("#")),
                        DataColumn(label: Text(AppLocalizations.of(context)!.medicine_name)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.unit_price)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.quantity)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.actions)),
                      ],
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
  List<Stock> stockData;
  List<Medicine> medicineName;
  final BuildContext context;

  MyData(this.stockData,this.medicineName, this.context,);

  @override
  DataRow getRow(int index) {

    final data = stockData[index];
    final medicineData = medicineName[index];
    return DataRow(cells: [
      DataCell(Text(data.medicineId.toString())),
      DataCell(Text(medicineData.name ?? 'No Name')),
      DataCell(Text(data.pricePerUnit.toString())),
      DataCell(Text(data.quantity.toString())),
      DataCell(IconButton(
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
                        Provider.of<StockProvider>(context, listen: false).deleteStocks(data.id ?? 0);
                        Navigator.of(context).pop();
                      },
                      child: Text(AppLocalizations.of(context)!.delete),
                    ),
                  ],
                );
              },
            );
      },
      icon: const Icon(Icons.delete, color: Colors.red,))),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => stockData.length;

  @override
  int get selectedRowCount => 0;
}