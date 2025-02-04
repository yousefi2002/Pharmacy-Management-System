import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../models/search_stock.dart';
import '../../providers/crud_for_stock.dart';

class StockPageOfMedicine extends StatefulWidget {
  const StockPageOfMedicine({super.key});

  @override
  _StockPageOfMedicineState createState() => _StockPageOfMedicineState();
}

class _StockPageOfMedicineState extends State<StockPageOfMedicine> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<StockProvider>(context, listen: false).fetchStocks();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.stock),
            const Expanded(child: SizedBox()),
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
                onChanged: (value) {
                  Provider.of<StockProvider>(context, listen: false)
                      .searchInStock(value);
                },
              ),
            ),
          ],
        ),
      ),
      body: Consumer<StockProvider>(
        builder: (context, stockProvider, child) {
          final stockList = stockProvider.stock;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: PaginatedDataTable(
                  source: MyData(stockList, context),
                  columns: [
                    const DataColumn(label: Text("#")),
                    DataColumn(
                        label:
                            Text(AppLocalizations.of(context)!.medicine_name)),
                    DataColumn(
                        label: Text(AppLocalizations.of(context)!.unit_price)),
                    DataColumn(
                        label: Text(AppLocalizations.of(context)!.quantity)),
                  ],
                  columnSpacing: 40,
                  horizontalMargin: 20,
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
  List<SearchStock> stockData;
  final BuildContext context;

  MyData(
    this.stockData,
    this.context,
  );

  @override
  DataRow getRow(int index) {
    final data = stockData[index];

    return DataRow(
      cells: [
        DataCell(Text('${index + 1}')),
        DataCell(Text(data.medicineName,
          style: TextStyle(
            color: data.quantity < 1 ? Colors.red
             : Colors.black),
        )),
        DataCell(Text(data.unitPrice.toString())),
        DataCell(Text(
          data.quantity.toString(),
          style:
              TextStyle(color: data.quantity < 1 ? Colors.red : Colors.black),
        )),
      ],
      color: WidgetStateProperty.all(Colors.grey.shade200),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => stockData.length;

  @override
  int get selectedRowCount => 0;
}
