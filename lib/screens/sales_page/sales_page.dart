// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:provider/provider.dart';
//
// import '../../models/medicines.dart';
// import '../../providers/crud_for_medicines.dart';
// import '../../providers/crud_for_sales.dart';
//
//
// class SalesPage extends StatefulWidget {
//   const SalesPage({super.key});
//
//   @override
//   State<SalesPage> createState() => _SalesPageState();
// }
//
// class _SalesPageState extends State<SalesPage> {
//   List<TextEditingController> medicineNameController = [];
//   List<TextEditingController> quantityController = [];
//   List<TextEditingController> feePriceController = [];
//   List<TextEditingController> discountController = [];
//   List<TextEditingController> totalPriceController = [];
//
//   void addRow() {
//     setState(() {
//       TextEditingController orderLar1 = TextEditingController();
//       TextEditingController feeLar1 = TextEditingController();
//       TextEditingController personLar1 = TextEditingController();
//       TextEditingController priceLar1 = TextEditingController();
//
//       medicineNameController.add(orderLar1);
//       quantityController.add(feeLar1);
//       feePriceController.add(personLar1);
//       discountController.add(priceLar1);
//       totalPriceController.add(priceLar1);
//     });
//   }
//
//   void deleteRow(int i) {
//     setState(() {
//       medicineNameController.removeAt(i);
//       quantityController.removeAt(i);
//       feePriceController.removeAt(i);
//       discountController.removeAt(i);
//       totalPriceController.removeAt(i);
//     });
//   }
//
//   final FocusNode focs1 = FocusNode();
//   final FocusNode focs2 = FocusNode();
//   final FocusNode focs3 = FocusNode();
//   final FocusNode focs4 = FocusNode();
//   final FocusNode focs5 = FocusNode();
//   final FocusNode focs6 = FocusNode();
//   final FocusNode focs7 = FocusNode();
//   final FocusNode focs8 = FocusNode();
//   final FocusNode focs9 = FocusNode();
//   double textFieldFontSize = 13.0;
//
//   @override
//   Widget build(BuildContext context) {
//     Future.microtask(() {
//       Provider.of<MedicinesProvider>(context, listen: false).fetchMedicines();
//     });
//     final medicinesProvider = Provider.of<MedicinesProvider>(context, listen: false);
//
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: addRow,
//         child: Icon(Icons.add),
//       ),
//       appBar: AppBar(),
//       body: Consumer<SalesProvider>(
//         builder: ( context, value, child) {
//           return SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Container(
//               color: Colors.blueAccent,
//               child: Column(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.grey.shade100,
//                         border: Border.all(
//                           color: Colors.black,
//                         )),
//                     width: double.infinity,
//                     height: 130,
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(AppLocalizations.of(context)!.patient_name),
//                                 Text(AppLocalizations.of(context)!.contact_number),
//                                 Text(AppLocalizations.of(context)!.related_doctor),
//                               ],
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             SizedBox(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   SizedBox(
//                                       width: 150,
//                                       height: 30,
//                                       child: TextFormField(
//                                         style:
//                                         TextStyle(fontSize: textFieldFontSize),
//                                         textAlign: TextAlign.center,
//                                         onFieldSubmitted: (value) {
//                                           FocusScope.of(context)
//                                               .requestFocus(focs2);
//                                         },
//                                         decoration: InputDecoration(
//                                           hintText: "name",
//                                           contentPadding:
//                                           EdgeInsets.symmetric(vertical: 8.0),
//                                           border: OutlineInputBorder(
//                                               borderRadius:
//                                               BorderRadius.circular(2)),
//                                         ),
//                                       )),
//                                   SizedBox(
//                                       width: 150,
//                                       height: 30,
//                                       child: TextFormField(
//                                         focusNode: focs2,
//                                         style:
//                                         TextStyle(fontSize: textFieldFontSize),
//                                         textAlign: TextAlign.center,
//                                         onFieldSubmitted: (value) {
//                                           FocusScope.of(context)
//                                               .requestFocus(focs3);
//                                         },
//                                         decoration: InputDecoration(
//                                             hintText: "phone",
//                                             contentPadding:
//                                             const EdgeInsets.symmetric(
//                                                 vertical: 8.0),
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                 BorderRadius.circular(2))),
//                                       )),
//                                   SizedBox(
//                                       width: 150,
//                                       height: 30,
//                                       child: TextFormField(
//                                         focusNode: focs3,
//                                         style:
//                                         TextStyle(fontSize: textFieldFontSize),
//                                         textAlign: TextAlign.center,
//                                         onFieldSubmitted: (value) {
//                                           FocusScope.of(context)
//                                               .requestFocus(focs4);
//                                         },
//                                         decoration: InputDecoration(
//                                             hintText: "doctor",
//                                             contentPadding:
//                                             EdgeInsets.symmetric(vertical: 8.0),
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                 BorderRadius.circular(2))),
//                                       )),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               width: 50,
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(AppLocalizations.of(context)!
//                                     .prescription_number),
//                                 Text(AppLocalizations.of(context)!
//                                     .prescription_date),
//                                 Text(AppLocalizations.of(context)!.sale_date),
//                               ],
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             SizedBox(
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   SizedBox(
//                                       width: 120,
//                                       height: 30,
//                                       child: TextFormField(
//                                         style:
//                                         TextStyle(fontSize: textFieldFontSize),
//                                         textAlign: TextAlign.center,
//                                         decoration: InputDecoration(
//                                             hintText: "no",
//                                             contentPadding:
//                                             EdgeInsets.symmetric(vertical: 8.0),
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                 BorderRadius.circular(2))),
//                                       )),
//                                   SizedBox(
//                                       width: 120,
//                                       height: 30,
//                                       child: TextFormField(
//                                         focusNode: focs1,
//                                         style:
//                                         TextStyle(fontSize: textFieldFontSize),
//                                         textAlign: TextAlign.center,
//                                         onFieldSubmitted: (value) {
//                                           FocusScope.of(context)
//                                               .requestFocus(focs2);
//                                         },
//                                         decoration: InputDecoration(
//                                             hintText: "s date",
//                                             contentPadding:
//                                             EdgeInsets.symmetric(vertical: 8.0),
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                 BorderRadius.circular(2))),
//                                       )),
//                                   SizedBox(
//                                       width: 120,
//                                       height: 30,
//                                       child: TextFormField(
//                                         style:
//                                         TextStyle(fontSize: textFieldFontSize),
//                                         textAlign: TextAlign.center,
//                                         decoration: InputDecoration(
//                                             hintText: "e date",
//                                             contentPadding:
//                                             EdgeInsets.symmetric(vertical: 8.0),
//                                             border: OutlineInputBorder(
//                                                 borderRadius:
//                                                 BorderRadius.circular(2))),
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   //////////////////////////////////////////////////////////////////////////
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.black),
//                       color: Colors.white,
//                     ),
//                     width: double.infinity,
//                     height: 450,
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
//                       child: Container(
//                         color: Colors.grey.shade100,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             children: [
//                               Table(
//                                 columnWidths: const {
//                                   0: FlexColumnWidth(0.5),
//                                   1: FlexColumnWidth(2),
//                                   2: FlexColumnWidth(1),
//                                   3: FlexColumnWidth(1),
//                                   4: FlexColumnWidth(1),
//                                   5: FlexColumnWidth(1),
//                                 },
//                                 children: [
//                                   TableRow(
//                                       decoration: BoxDecoration(
//                                           border: Border.all(color: Colors.black),
//                                           borderRadius: BorderRadius.circular(1)),
//                                       children: [
//                                         const Center(child: Text("#")),
//                                         Center(child: Text(AppLocalizations.of(context)!.medicine_name)),
//                                         Center(child: Text(AppLocalizations.of(context)!.quantity)),
//                                         Center(child: Text(AppLocalizations.of(context)!.unit_price)),
//                                         Center(child: Text(AppLocalizations.of(context)!.total_price)),
//                                         Center(child: Text(AppLocalizations.of(context)!.discount)),
//                                       ]),
//                                   for (int i = 0;
//                                   i < medicineNameController.length;
//                                   i++)
//                                     TableRow(children: [
//                                       SizedBox(
//                                           height: 30,
//                                           child: TextFormField(
//                                             style: TextStyle(
//                                                 fontSize: textFieldFontSize),
//                                             textAlign: TextAlign.center,
//                                             decoration: InputDecoration(
//                                                 hintText: '${i+1}',
//                                                 contentPadding:
//                                                 const EdgeInsets.symmetric(
//                                                     vertical: 8.0),
//                                                 border: OutlineInputBorder(
//                                                     borderRadius:
//                                                     BorderRadius.circular(2))),
//                                           )),
//                                       SizedBox(
//                                         width: 120,
//                                         height: 37,
//                                         child: DropdownButton2<Medicine>(
//                                           focusNode: focs4,
//                                           items: medicinesProvider.medicines.map((medicine) {
//                                             return DropdownMenuItem(
//                                               value: medicine,
//                                               child: Text(medicine.name),
//                                             );
//                                           }).toList(),
//                                           onChanged: (value) {
//                                             // medicinesProvider.selectMedicine(value!);
//                                           },
//                                           // hint:  Text(medicinesProvider.selectedMedicine?.name ??""),
//                                           dropdownSearchData: DropdownSearchData(
//                                             searchInnerWidgetHeight: 5,
//                                             searchInnerWidget: Container(
//                                               height: 60,
//                                               padding: const EdgeInsets.all(8.0),
//                                               child: TextFormField(
//                                                 expands: true,
//                                                 maxLines: null,
//                                                 decoration: const InputDecoration(hintText: "Search"),
//                                                 onFieldSubmitted: (value) {
//                                                   FocusScope.of(context).requestFocus(focs6);
//                                                 },
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                           width: 120,
//                                           height: 30,
//                                           child: TextFormField(
//                                             controller: quantityController[i],
//                                             focusNode: focs5,
//                                             style: TextStyle(
//                                                 fontSize: textFieldFontSize),
//                                             textAlign: TextAlign.center,
//                                             decoration: InputDecoration(
//                                                 hintText:
//                                                 AppLocalizations.of(context)!
//                                                     .quantity,
//                                                 contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     vertical: 8.0),
//                                                 border: OutlineInputBorder(
//                                                     borderRadius:
//                                                     BorderRadius.circular(2))),
//                                           )),
//                                       SizedBox(
//                                           width: 120,
//                                           height: 30,
//                                           child: TextFormField(
//                                             controller: feePriceController[i],
//                                             focusNode: focs6,
//                                             style: TextStyle(
//                                                 fontSize: textFieldFontSize),
//                                             textAlign: TextAlign.center,
//                                             onFieldSubmitted: (value) {
//                                               FocusScope.of(context)
//                                                   .requestFocus(focs7);
//                                             },
//                                             decoration: InputDecoration(
//                                                 hintText:
//                                                 AppLocalizations.of(context)!
//                                                     .unit_price,
//                                                 contentPadding:
//                                                 const EdgeInsets.symmetric(
//                                                     vertical: 8.0),
//                                                 border: OutlineInputBorder(
//                                                     borderRadius:
//                                                     BorderRadius.circular(2))),
//                                           )),
//                                       SizedBox(
//                                           width: 120,
//                                           height: 30,
//                                           child: TextFormField(
//                                             controller: totalPriceController[i],
//                                             focusNode: focs7,
//                                             style: TextStyle(
//                                                 fontSize: textFieldFontSize),
//                                             textAlign: TextAlign.center,
//                                             onFieldSubmitted: (value) {
//                                               FocusScope.of(context)
//                                                   .requestFocus(focs8);
//                                             },
//                                             decoration: InputDecoration(
//                                                 hintText:
//                                                 AppLocalizations.of(context)!
//                                                     .total_price,
//                                                 contentPadding:
//                                                 const EdgeInsets.symmetric(
//                                                     vertical: 8.0),
//                                                 border: OutlineInputBorder(
//                                                     borderRadius:
//                                                     BorderRadius.circular(2))),
//                                           )),
//                                       SizedBox(
//                                           width: 120,
//                                           height: 30,
//                                           child: TextFormField(
//                                             controller: discountController[i],
//                                             focusNode: focs8,
//                                             style: TextStyle(
//                                                 fontSize: textFieldFontSize),
//                                             textAlign: TextAlign.center,
//                                             onFieldSubmitted: (value) {
//                                               FocusScope.of(context)
//                                                   .requestFocus(focs9);
//                                             },
//                                             decoration: InputDecoration(
//                                                 hintText:
//                                                 AppLocalizations.of(context)!
//                                                     .discount,
//                                                 contentPadding:
//                                                 const EdgeInsets.symmetric(
//                                                     vertical: 8.0),
//                                                 border: OutlineInputBorder(
//                                                     borderRadius:
//                                                     BorderRadius.circular(2))),
//                                           )),
//                                     ])
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.grey.shade100,
//                         border: Border.all(color: Colors.black)),
//                     width: double.infinity,
//                     height: 130,
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('${AppLocalizations.of(context)!.total_price} :  '),
//                                 Text('${AppLocalizations.of(context)!.discount} :  '),
//                                 Text('${AppLocalizations.of(context)!.amount_payable} :  '),
//                               ],
//                             ),
//                             const SizedBox(
//                               width: 80,
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                           backgroundColor: Colors.yellowAccent),
//                                       child:
//                                       Text(AppLocalizations.of(context)!.save),
//                                     ),
//                                     const SizedBox(
//                                       width: 15,
//                                     ),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                           backgroundColor: Colors.yellowAccent),
//                                       child: Text(AppLocalizations.of(context)!
//                                           .save_and_print),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

//-------------------------------------------------------------------
//-------------------------------------------------------------------
//-------------------------------------------------------------------

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fargard_pharmacy_management_system/models/sales.dart';
import 'package:fargard_pharmacy_management_system/models/sales_details.dart';
import 'package:fargard_pharmacy_management_system/models/suppliers.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_sales.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_sales_detail.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_supplier.dart';
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
import '../../utilities/date_time_format.dart';
import '../purches_page/Purchase_page.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  List<String?> selectedMedicines = [];
  List<Medicine?> selectedMedicineDetails = [];
  final List<TextEditingController> quantityControllers = [];
  final List<TextEditingController> unitPriceControllers = [];
  final List<TextEditingController> discountControllers = [];
  final List<double> totalPriceForEachSelections = [];

  String? date;
  double? saleTotalPrice = 0;
  double? discount = 0;
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

  final ScrollController _scrollController = ScrollController();

  void scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.extentTotal, // Go to end
      duration: Duration(milliseconds: 500), // Smooth scroll
      curve: Curves.easeOut, // Easing animation
    );
  }

  @override
  void initState() {
    super.initState();
    date = formatLocalTime(DateTime.now().toIso8601String(), justMonth: true);
    // Scroll to the end when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToEnd());
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<MedicinesProvider>(context, listen: false).fetchMedicines();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 5,
          children: [
            Text("Sales Page"),
            Expanded(child: SizedBox()),
            // Text(
              // "Supplier",
              // style: TextStyle(fontSize: 19),
            // ),
            // Consumer<SupplierProvider>(
            //     builder: (context, supplierProvider, child) {
            //       return DropdownButton2<Supplier>(
            //         items: supplierProvider.suppliers
            //             .map(
            //               (supplier) => DropdownMenuItem<Supplier>(
            //             value: supplier,
            //             child: Center(child: Text(supplier.name)),
            //           ),
            //         )
            //             .toList(),
            //         onChanged: (value) {
            //           setState(() {
            //             supplier = value;
            //           });
            //         },
            //         hint: Center(child: Text(supplier?.name ?? 'Supplier Name')),
                    // dropdownSearchData: DropdownSearchData(
                    //   searchController: _searchController,
                    //   searchInnerWidgetHeight: 150,
                    //   searchInnerWidget: BuildTextFormField(
                    //     controller: _searchController,
                    //     hint: 'Search for medicines...',
                    //     focusNode: null,
                    //     requestNode: null,
                    //     onChange: (value) {
                    //       medicinesProvider.searchMedicines(value);
                    //     },
                    //   ),
                    // ),
                  // );
                // }),
            Text(
              "Date",
              style: TextStyle(fontSize: 19),
            ),
            TextButton(
              onPressed: () async {
                DateTime? pickedDate = await myDatePicker(context);
                if (pickedDate != null) {
                  setState(() {
                    // date = "${pickedDate.year}/${pickedDate.month}/${pickedDate.day}";
                    date = formatLocalTime(pickedDate.toIso8601String(),
                        justMonth: true);
                  });
                }
              },
              child: Text(
                // '${AppLocalizations.of(context)!.registration_date} | $date',
                '$date',
              ),
            )
          ],
        ),
      ),
      body: Consumer<MedicinesProvider>(
        builder: (context, medicinesProvider, child) {
          return Column(
            children: [
              // Table with rows
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  // height: 250,
                  child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Table(
                            border: TableBorder.all(color: Colors.grey),
                            columnWidths: const {
                              0: FlexColumnWidth(0.5),
                              1: FlexColumnWidth(2),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(1),
                              4: FlexColumnWidth(1),
                              5: FlexColumnWidth(1),
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
                                    child: Text("Discount",
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Total Price",
                                        textAlign: TextAlign.center),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Actions",
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              ),
                              // Dynamically added rows
                              ..._buildRows(medicinesProvider),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10), // Rounded corners
                                )),
                            onPressed: () {
                              setState(() {
                                _addRow();
                                scrollToEnd();
                              });
                            },
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 9.0),
                              child: Text(
                                  AppLocalizations.of(context)!.newMedicine),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              // Footer section
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey)),
                width: double.infinity,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 20,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${AppLocalizations.of(context)!.total_price} :  $saleTotalPrice AFG'),
                         const SizedBox(width: 15,),
                          Text(
                              '${AppLocalizations.of(context)!.discount} :  $discount AFG'),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          _savePurchase(
                              context, selectedMedicineDetails, indexData);
                          // Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.save),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          _printPurchase();
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.print),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  List<TableRow> _buildRows(MedicinesProvider medicinesProvider) {
    final searchController = TextEditingController();
    return List<TableRow>.generate(
      selectedMedicines.length,
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
                      medicinesProvider.selectMedicine(value!);
                      selectedMedicines[index] = value.name;
                      selectedMedicineDetails[index] = value;
                      unitPriceControllers[index].text =
                          value.pricePerUnit.toString() ?? '';
                      _updateTotalPrice(index);
                      indexData = index;
                    });
                  },
                  hint: Text(selectedMedicines[index] ?? 'Medicine Name'),
                  dropdownSearchData: DropdownSearchData(
                    searchController: searchController,
                    searchInnerWidgetHeight: 150,
                    searchInnerWidget: BuildTextFormField(
                      controller: searchController,
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
                child: BuildTextFormField(
                  controller: quantityControllers[index],
                  hint: '0',
                  focusNode: null,
                  requestNode: null,
                  onChange: (_) {
                    setState(() {
                      _updateTotalPrice(index);
                    });
                  },
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
                  onChange: (_) {
                    setState(() {
                      _updateTotalPrice(index);
                    });
                  },
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BuildTextFormField(
                  controller: discountControllers[index],
                  hint: '0',
                  focusNode: null,
                  requestNode: null,
                  onChange: (_) {
                    setState(() {
                      _updateTotalPrice(index);
                    });
                  },
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "${totalPriceForEachSelections[index]}",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        _deleteRow(index);
                      });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
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
    discountControllers.add(TextEditingController());
    totalPriceForEachSelections.add(0);
  }

  void _deleteRow(index) {
    selectedMedicines.removeAt(index);
    selectedMedicineDetails.removeAt(index);
    quantityControllers.removeAt(index);
    unitPriceControllers.removeAt(index);
    discountControllers.removeAt(index);
    totalPriceForEachSelections.removeAt(index);
  }

  void _updateTotalPrice(int index) {
    final quantity = int.tryParse(quantityControllers[index].text) ?? 0;
    final unitPrice = double.tryParse(unitPriceControllers[index].text) ?? 0.0;
    discount = double.tryParse(discountControllers[index].text) ?? 0.0;
    totalPriceForEachSelections[index] = (quantity * unitPrice - discount!);
    saleTotalPrice = totalPriceForEachSelections.reduce((x, y) => x + y);
  }

  // void _savePurchase(context, List<Medicine?> medicine, int index) async {
  //   //step #1
  //   Provider.of<PurchasesProvider>(context, listen: false)
  //       .addPurchase(Purchase(date, double.tryParse(purchaseTotalPrice.toString()), supplier?.id ?? 0));
  //
  //   //step #2
  //   Provider.of<PurchasesProvider>(context, listen: false)
  //       .fetchLastInsertedPurchaseId();
  //   int lastInsertedPurchaseId =
  //       Provider.of<PurchasesProvider>(context, listen: false)
  //           .lastInsertedPurchaseId;
  //
  //   _updateTotalPrice(index);
  //
  //   //step #3
  //   List<PurchaseDetails> purchaseDetails = [];
  //   for (int i = 0; i < selectedMedicineDetails.length; i++) {
  //     {
  //       purchaseDetails.add(PurchaseDetails(
  //         selectedMedicineDetails[i]?.id,
  //         lastInsertedPurchaseId,
  //         int.tryParse(quantityControllers[i].text),
  //         double.tryParse(unitPriceControllers[i].text),
  //       ));
  //       //totalPriceForEachSelections[i]
  //     }
  //     Provider.of<PurchasesDetailProvider>(context, listen: false)
  //         .addPurchasesDetails(purchaseDetails);
  //   }
  //
  //   //step #4
  //
  //   for (int j = 0; j < selectedMedicineDetails.length; j++){
  //     final addUpdateStock = Stock(selectedMedicineDetails[j]?.id, double.tryParse(unitPriceControllers[j].text), int.tryParse(quantityControllers[j].text));
  //     Provider.of<StockProvider>(context, listen: false)
  //         .insertUpdateStocks(addUpdateStock, selectedMedicineDetails[j]!.id ?? 0, int.tryParse(quantityControllers[j].text) ?? 0);
  //   }
  //
  //   //temp
  //   Navigator.pop(context);
  // }

  void _savePurchase(context, List<Medicine?> medicine, int index) async {
    //step #1
    Provider.of<SalesProvider>(context, listen: false)
        .addSales(Sales(
      null, null, date, discount, saleTotalPrice,),);

    //step #2
    Provider.of<SalesProvider>(context, listen: false).fetchLastInsertedPurchaseId();
    int lastInsertedSalesId =
        Provider.of<SalesProvider>(context, listen: false)
            .lastInsertedSalesId;

    _updateTotalPrice(index);

    //step #3
    List<SalesDetails> salesDetailsList = [];
    for (int i = 0; i < selectedMedicineDetails.length; i++) {
      {
        salesDetailsList.add(
            SalesDetails(
                null,
                null,
                int.tryParse(quantityControllers[i].text),
                double.tryParse(unitPriceControllers[i].text),
                saleTotalPrice));
        //totalPriceForEachSelections[i]
      }
      final a = Provider.of<SalesDetailProvider>(context, listen: false)
          .addSalesDetails(salesDetailsList);
    }

    //step #4

    for (int j = 0; j < selectedMedicineDetails.length; j++){
      final addUpdateStock = Stock(
        selectedMedicineDetails[j]?.id,
        double.tryParse(unitPriceControllers[j].text),
        int.tryParse(quantityControllers[j].text));
      Provider.of<StockProvider>(context, listen: false)
          .updateStocksIfExist(addUpdateStock, selectedMedicineDetails[j]!.id ?? 0, int.tryParse(quantityControllers[j].text) ?? 0);
    }

    Navigator.pop(context);
  }


  void _printPurchase() {}
}

