import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/medicines.dart';
import '../../models/purchase_details.dart';
import '../../models/purchases.dart';
import '../../models/stocks.dart';
import '../../providers/crud_for_medicines.dart';
import '../../providers/crud_for_purchase.dart';
import '../../providers/crud_for_purchase_detai.dart';
import '../../providers/crud_for_stock.dart';


class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  List<TableRow> rows = [];
  List<String?> selectedMedicines = [];
  List<Medicine?> selectedMedicineDetails = [];
  final List<TextEditingController> quantityControllers = [];
  final List<TextEditingController> unitPriceControllers = [];
  final List<TextEditingController> totalPriceControllers = [];

  final now = DateTime.now();
  String? date;
  int indexData = 0;

  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final FocusNode focs5 = FocusNode();
  final FocusNode focs6 = FocusNode();
  final FocusNode focs7 = FocusNode();
  final FocusNode focs8 = FocusNode();
  final FocusNode focs9 = FocusNode();

  void _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != date) {
      setState(() {
        date = "${pickedDate.year}/${pickedDate.month}/${pickedDate.day}";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    date = "${now.year}/${now.month}/${now.day}";
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<MedicinesProvider>(context, listen: false).fetchMedicines();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Purchase Page"),
      ),
      body: Consumer<MedicinesProvider>(
        builder: (context, medicinesProvider, child) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.green.shade50,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(color: Colors.black)),
                    width: double.infinity,
                    height: 130,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLocalizations.of(context)!
                                    .invoice_number),
                                Text(AppLocalizations.of(context)!.account),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 30,
                                    child: TextFormField(
                                      style: TextStyle(fontSize: 13),
                                      textAlign: TextAlign.center,
                                      focusNode: focs1,
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(focs2);
                                      },
                                      decoration: InputDecoration(
                                        hintText: "شماره فاکتور",
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    height: 30,
                                    child: TextFormField(
                                      focusNode: focs2,
                                      style: TextStyle(fontSize: 13),
                                      textAlign: TextAlign.center,
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(focs3);
                                      },
                                      decoration: InputDecoration(
                                          hintText: "طرف حساب",
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 8.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Table with rows
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 450,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(80, 5, 80, 15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                _pickDate(context);
                              },
                              child: Text(
                                '${AppLocalizations.of(context)!.registration_date} | $date',
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Table(
                              border: TableBorder.all(color: Colors.black),
                              columnWidths: const {
                                0: FlexColumnWidth(0.5),
                                1: FlexColumnWidth(2),
                                2: FlexColumnWidth(1),
                                3: FlexColumnWidth(1),
                                4: FlexColumnWidth(1),
                              },
                              children: [
                                // Header Row
                                const TableRow(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("No.",
                                          textAlign: TextAlign.center),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Medicine",
                                          textAlign: TextAlign.center),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Quantity",
                                          textAlign: TextAlign.center),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Unit Price",
                                          textAlign: TextAlign.center),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Total Price",
                                          textAlign: TextAlign.center),
                                    ),
                                  ],
                                ),
                                // Dynamically added rows
                                ..._buildRows(medicinesProvider),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
//                   // Footer section
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(color: Colors.black)),
                    width: double.infinity,
                    height: 130,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${AppLocalizations.of(context)!.total_price} :  0 AFs'),
                                Text(
                                    '${AppLocalizations.of(context)!.discount} :  0 AFs'),
                                Text(
                                    '${AppLocalizations.of(context)!.amount_payable} :  0 AFs'),
                              ],
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () async{
                                    addPurchasePurchaseDetailsStocks(selectedMedicineDetails , indexData);
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.lightGreen),
                                  child:
                                      Text(AppLocalizations.of(context)!.save),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _addRow();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  List<TableRow> _buildRows(MedicinesProvider medicinesProvider) {
    final _searchController = TextEditingController();
    return List<TableRow>.generate(
      rows.length,
      (index) {
        return TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text((index + 1).toString(), textAlign: TextAlign.center),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton2<Medicine>(
                  items: medicinesProvider.medicines
                      .map(
                        (medicine) => DropdownMenuItem<Medicine>(
                          value: medicine,
                          child: Text(medicine.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedMedicines[index] = value?.name;
                      selectedMedicineDetails[index] =
                          medicinesProvider.selectMedicine(value!);
                      unitPriceControllers[index].text = selectedMedicineDetails[index]?.pricePerUnit
                                  .toString() ??
                              '';
                      unitPriceControllers[index].text = medicinesProvider
                          .selectedMedicine!.pricePerUnit
                          .toString();
                      _updateTotalPrice(index);
                       indexData = index;
                    });
                  },
                  hint: Text(selectedMedicines[index] ?? 'Medicine Name'),
                  dropdownSearchData: DropdownSearchData(
                    searchController: _searchController,
                    searchInnerWidgetHeight: 150,
                    searchInnerWidget: BuildTextFormField(
                      controller: _searchController,
                      hint: 'Search for medicines...',
                      focusNode: null,
                      requestNode: null,
                      onChange: (value) {
                        medicinesProvider.searchMedicines(value);
                      },
                    ),
                  ),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BuildTextFormField(
                    controller: quantityControllers[index],
                    hint: '0',
                    focusNode: null,
                    requestNode: null,
                    onChange: (_) {},
                  ),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BuildTextFormField(
                  controller: unitPriceControllers[index],
                  hint: "0",
                  focusNode: null,
                  requestNode: null,
                  onChange: (_) {},
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BuildTextFormField(
                  controller: totalPriceControllers[index],
                  hint: '0',
                  focusNode: null,
                  requestNode: null,
                  onChange: (_) {},
                ),
              ),
            ),
          ],
        );

      },
    );
  }

  void _addRow() {
    selectedMedicines.add(null);
    selectedMedicineDetails.add(null);
    quantityControllers.add(TextEditingController());
    unitPriceControllers.add(TextEditingController());
    totalPriceControllers.add(TextEditingController());
    rows.add(const TableRow(children: [])); // Add an empty row for now
  }

  _updateTotalPrice(int index) {
    final quantity = int.tryParse(quantityControllers[index].text) ?? 0;
    final unitPrice = double.tryParse(unitPriceControllers[index].text) ?? 0.0;
    totalPriceControllers[index].text =
        (quantity * unitPrice).toStringAsFixed(2);
    return double.tryParse(totalPriceControllers[index].text);
  }

  addPurchasePurchaseDetailsStocks(List<Medicine?> medicine, int index) async {
    List<Purchase> purchase = [];
    for (var med in medicine) {
      final insetIntoPurchase = Purchase(med?.id ?? 0, 0, int.tryParse(quantityControllers[index].text), date, med?.pricePerUnit ?? 0, _updateTotalPrice(index));
      await Provider.of<PurchasesProvider>(context, listen: false).addPurchases(insetIntoPurchase);
      print(insetIntoPurchase);
      setState(() {
        purchase.add(insetIntoPurchase);
      });
    }
      List<PurchaseDetails> purchaseDetail = [];
      for (int i = 0; i < purchase.length; i++) {
        final insertIntoPurchaseDetail = PurchaseDetails(purchase[i].medicineId, 0, purchase[i].quantity, purchase[i].pricePerUnit);
        await Provider.of<PurchasesDetailProvider>(context, listen: false).addPurchasesDetails(insertIntoPurchaseDetail);
        print(insertIntoPurchaseDetail);
        setState(() {
          purchaseDetail.add(insertIntoPurchaseDetail);
        });
      }
        for (int j = 0; j < purchaseDetail.length; j++) {
          final insertIntoStock = Stock(purchaseDetail[j].medicineId, purchaseDetail[j].pricePerUnit, purchaseDetail[j].quantity);
          await Provider.of<StockProvider>(context, listen: false).insertUpdateStocks(insertIntoStock, purchaseDetail[j].medicineId, purchaseDetail[j].quantity);
          print(insertIntoStock);
        }
  }
}

class BuildTextFormField extends StatelessWidget {
  const BuildTextFormField(
      {super.key,
      required this.controller,
      required this.hint,
      this.focusNode,
      this.requestNode,
      required this.onChange});

  final TextEditingController? controller;
  final String hint;
  final FocusNode? focusNode;
  final FocusNode? requestNode;
  final Function(String value) onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: true,
      controller: controller,
      focusNode: focusNode,
      style: const TextStyle(fontSize: 13.0),
      textAlign: TextAlign.center,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(requestNode);
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
