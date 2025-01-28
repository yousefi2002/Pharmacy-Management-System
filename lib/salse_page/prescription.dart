import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fargard_pharmacy_management_system/medicines%20List/crud_for_medicines.dart';
import 'package:fargard_pharmacy_management_system/salse_page/crud_for_sales.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../modal_classes/medicines.dart';

class PrescriptionPage extends StatefulWidget {
  const PrescriptionPage({super.key});

  @override
  State<PrescriptionPage> createState() => _PrescriptionPageState();
}

class _PrescriptionPageState extends State<PrescriptionPage> {
  List<TextEditingController> medicineNameController = [];
  List<TextEditingController> quantityController = [];
  List<TextEditingController> feePriceController = [];
  List<TextEditingController> discountController = [];
  List<TextEditingController> totalPriceController = [];

  void addRow() {
    setState(() {
      TextEditingController orderLar1 = TextEditingController();
      TextEditingController feeLar1 = TextEditingController();
      TextEditingController personLar1 = TextEditingController();
      TextEditingController priceLar1 = TextEditingController();

      medicineNameController.add(orderLar1);
      quantityController.add(feeLar1);
      feePriceController.add(personLar1);
      discountController.add(priceLar1);
      totalPriceController.add(priceLar1);
    });
  }

  void deleteRow(int i) {
    setState(() {
      medicineNameController.removeAt(i);
      quantityController.removeAt(i);
      feePriceController.removeAt(i);
      discountController.removeAt(i);
      totalPriceController.removeAt(i);
    });
  }

  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final FocusNode focs5 = FocusNode();
  final FocusNode focs6 = FocusNode();
  final FocusNode focs7 = FocusNode();
  final FocusNode focs8 = FocusNode();
  final FocusNode focs9 = FocusNode();
  double textFieldFontSize = 13.0;

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<MedicinesProvider>(context, listen: false).fetchMedicines();
    });
    final medicinesProvider = Provider.of<MedicinesProvider>(context, listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addRow,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: Consumer<SalesProvider>(
        builder: ( context, value, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: Colors.blueAccent,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(
                          color: Colors.black,
                        )),
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
                                Text(AppLocalizations.of(context)!.patient_name),
                                Text(AppLocalizations.of(context)!.contact_number),
                                Text(AppLocalizations.of(context)!.related_doctor),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      width: 150,
                                      height: 30,
                                      child: TextFormField(
                                        style:
                                        TextStyle(fontSize: textFieldFontSize),
                                        textAlign: TextAlign.center,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context)
                                              .requestFocus(focs2);
                                        },
                                        decoration: InputDecoration(
                                          hintText: "name",
                                          contentPadding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(2)),
                                        ),
                                      )),
                                  SizedBox(
                                      width: 150,
                                      height: 30,
                                      child: TextFormField(
                                        focusNode: focs2,
                                        style:
                                        TextStyle(fontSize: textFieldFontSize),
                                        textAlign: TextAlign.center,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context)
                                              .requestFocus(focs3);
                                        },
                                        decoration: InputDecoration(
                                            hintText: "phone",
                                            contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(2))),
                                      )),
                                  SizedBox(
                                      width: 150,
                                      height: 30,
                                      child: TextFormField(
                                        focusNode: focs3,
                                        style:
                                        TextStyle(fontSize: textFieldFontSize),
                                        textAlign: TextAlign.center,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context)
                                              .requestFocus(focs4);
                                        },
                                        decoration: InputDecoration(
                                            hintText: "doctor",
                                            contentPadding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(2))),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(AppLocalizations.of(context)!
                                    .prescription_number),
                                Text(AppLocalizations.of(context)!
                                    .prescription_date),
                                Text(AppLocalizations.of(context)!.sale_date),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      width: 120,
                                      height: 30,
                                      child: TextFormField(
                                        style:
                                        TextStyle(fontSize: textFieldFontSize),
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            hintText: "no",
                                            contentPadding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(2))),
                                      )),
                                  SizedBox(
                                      width: 120,
                                      height: 30,
                                      child: TextFormField(
                                        focusNode: focs1,
                                        style:
                                        TextStyle(fontSize: textFieldFontSize),
                                        textAlign: TextAlign.center,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context)
                                              .requestFocus(focs2);
                                        },
                                        decoration: InputDecoration(
                                            hintText: "s date",
                                            contentPadding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(2))),
                                      )),
                                  SizedBox(
                                      width: 120,
                                      height: 30,
                                      child: TextFormField(
                                        style:
                                        TextStyle(fontSize: textFieldFontSize),
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            hintText: "e date",
                                            contentPadding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(2))),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //////////////////////////////////////////////////////////////////////////
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    height: 450,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                      child: Container(
                        color: Colors.grey.shade100,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(0.5),
                                  1: FlexColumnWidth(2),
                                  2: FlexColumnWidth(1),
                                  3: FlexColumnWidth(1),
                                  4: FlexColumnWidth(1),
                                  5: FlexColumnWidth(1),
                                },
                                children: [
                                  TableRow(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.circular(1)),
                                      children: [
                                        const Center(child: Text("#")),
                                        Center(child: Text(AppLocalizations.of(context)!.medicine_name)),
                                        Center(child: Text(AppLocalizations.of(context)!.quantity)),
                                        Center(child: Text(AppLocalizations.of(context)!.unit_price)),
                                        Center(child: Text(AppLocalizations.of(context)!.total_price)),
                                        Center(child: Text(AppLocalizations.of(context)!.discount)),
                                      ]),
                                  for (int i = 0;
                                  i < medicineNameController.length;
                                  i++)
                                    TableRow(children: [
                                      SizedBox(
                                          height: 30,
                                          child: TextFormField(
                                            style: TextStyle(
                                                fontSize: textFieldFontSize),
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                                hintText: '${i+1}',
                                                contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(2))),
                                          )),
                                      SizedBox(
                                        width: 120,
                                        height: 37,
                                        child: DropdownButton2<Medicine>(
                                          focusNode: focs4,
                                          items: medicinesProvider.medicines.map((medicine) {
                                            return DropdownMenuItem(
                                              value: medicine,
                                              child: Text(medicine.name),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            // medicinesProvider.selectMedicine(value!);
                                          },
                                          // hint:  Text(medicinesProvider.selectedMedicine?.name ??""),
                                          dropdownSearchData: DropdownSearchData(
                                            searchInnerWidgetHeight: 5,
                                            searchInnerWidget: Container(
                                              height: 60,
                                              padding: const EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                expands: true,
                                                maxLines: null,
                                                decoration: const InputDecoration(hintText: "Search"),
                                                onFieldSubmitted: (value) {
                                                  FocusScope.of(context).requestFocus(focs6);
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          width: 120,
                                          height: 30,
                                          child: TextFormField(
                                            controller: quantityController[i],
                                            focusNode: focs5,
                                            style: TextStyle(
                                                fontSize: textFieldFontSize),
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                                hintText:
                                                AppLocalizations.of(context)!
                                                    .quantity,
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(2))),
                                          )),
                                      SizedBox(
                                          width: 120,
                                          height: 30,
                                          child: TextFormField(
                                            controller: feePriceController[i],
                                            focusNode: focs6,
                                            style: TextStyle(
                                                fontSize: textFieldFontSize),
                                            textAlign: TextAlign.center,
                                            onFieldSubmitted: (value) {
                                              FocusScope.of(context)
                                                  .requestFocus(focs7);
                                            },
                                            decoration: InputDecoration(
                                                hintText:
                                                AppLocalizations.of(context)!
                                                    .unit_price,
                                                contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(2))),
                                          )),
                                      SizedBox(
                                          width: 120,
                                          height: 30,
                                          child: TextFormField(
                                            controller: totalPriceController[i],
                                            focusNode: focs7,
                                            style: TextStyle(
                                                fontSize: textFieldFontSize),
                                            textAlign: TextAlign.center,
                                            onFieldSubmitted: (value) {
                                              FocusScope.of(context)
                                                  .requestFocus(focs8);
                                            },
                                            decoration: InputDecoration(
                                                hintText:
                                                AppLocalizations.of(context)!
                                                    .total_price,
                                                contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(2))),
                                          )),
                                      SizedBox(
                                          width: 120,
                                          height: 30,
                                          child: TextFormField(
                                            controller: discountController[i],
                                            focusNode: focs8,
                                            style: TextStyle(
                                                fontSize: textFieldFontSize),
                                            textAlign: TextAlign.center,
                                            onFieldSubmitted: (value) {
                                              FocusScope.of(context)
                                                  .requestFocus(focs9);
                                            },
                                            decoration: InputDecoration(
                                                hintText:
                                                AppLocalizations.of(context)!
                                                    .discount,
                                                contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 8.0),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(2))),
                                          )),
                                    ])
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  const SizedBox(
                    height: 20,
                  ),
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
                                Text('${AppLocalizations.of(context)!.total_price} :  '),
                                Text('${AppLocalizations.of(context)!.discount} :  '),
                                Text('${AppLocalizations.of(context)!.amount_payable} :  '),
                              ],
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.yellowAccent),
                                      child:
                                      Text(AppLocalizations.of(context)!.save),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.yellowAccent),
                                      child: Text(AppLocalizations.of(context)!
                                          .save_and_print),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
