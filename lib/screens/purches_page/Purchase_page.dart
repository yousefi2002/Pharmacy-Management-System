import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fargard_pharmacy_management_system/models/suppliers.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_customer.dart';
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

class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  List<String?> selectedMedicines = [];
  List<Medicine?> selectedMedicineDetails = [];
  final List<TextEditingController> quantityControllers = [];
  final List<TextEditingController> unitPriceControllers = [];
  final List<double> totalPriceForEachSelections = [];

  Supplier? supplier;
  String? date;
  double? purchaseTotalPrice = 0;
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
      Provider.of<SupplierProvider>(context, listen: false).fetchSuppliers();
      Provider.of<PurchasesProvider>(context, listen: false).fetchPurchases();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 5,
          children: [
            const Text("Purchase Page"),
            const Expanded(child: SizedBox()),
            const Text(
              "Supplier",
              style: TextStyle(fontSize: 19),
            ),
            Consumer<SupplierProvider>(
                builder: (context, supplierProvider, child) {
              return DropdownButton2<Supplier>(
                items: supplierProvider.suppliers
                    .map(
                      (supplier) => DropdownMenuItem<Supplier>(
                        value: supplier,
                        child: Center(child: Text(supplier.name)),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    supplier = value;
                  });
                },
                hint: Center(child: Text(supplier?.name ?? 'Supplier Name')),
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
              );
            }),
            const SizedBox(width: 20,),
            const Text(
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
            ),
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
                          const SizedBox(
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
                      Text(
                          '${AppLocalizations.of(context)!.total_price} :  $purchaseTotalPrice AFG'),
                      ElevatedButton(
                        onPressed: () async {
                          _savePurchase(
                              context, selectedMedicineDetails, indexData);
                          // Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.save),
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
                          value.buyPrice.toString() ?? '';
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
                    icon: const Icon(
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
    totalPriceForEachSelections.add(0);
  }

  void _deleteRow(index) {
    selectedMedicines.removeAt(index);
    selectedMedicineDetails.removeAt(index);
    quantityControllers.removeAt(index);
    unitPriceControllers.removeAt(index);
    totalPriceForEachSelections.removeAt(index);
  }

  void _updateTotalPrice(int index) {
    final quantity = int.tryParse(quantityControllers[index].text) ?? 0;
    final unitPrice = double.tryParse(unitPriceControllers[index].text) ?? 0.0;
    totalPriceForEachSelections[index] = (quantity * unitPrice);
    purchaseTotalPrice = totalPriceForEachSelections.reduce((x, y) => x + y);
  }

  void _savePurchase(context, List<Medicine?> medicine, int index) async {
    //step #1
    Provider.of<PurchasesProvider>(context, listen: false)
        .addPurchase(Purchase(date, double.tryParse(purchaseTotalPrice.toString()), supplier?.id ?? 0));

    //step #2
    Provider.of<PurchasesProvider>(context, listen: false)
        .fetchLastInsertedPurchaseId();
    int lastInsertedPurchaseId =
        Provider.of<PurchasesProvider>(context, listen: false)
            .lastInsertedPurchaseId;

    _updateTotalPrice(index);

    //step #3
    List<PurchaseDetails> purchaseDetails = [];
    for (int i = 0; i < selectedMedicineDetails.length; i++) {
      {
        purchaseDetails.add(PurchaseDetails(
          selectedMedicineDetails[i]?.id,
          lastInsertedPurchaseId,
          int.tryParse(quantityControllers[i].text),
          double.tryParse(unitPriceControllers[i].text),
        ));
        //totalPriceForEachSelections[i]
      }
      Provider.of<PurchasesDetailProvider>(context, listen: false)
        .addPurchasesDetails(purchaseDetails);
    }

    //step #4

    for (int j = 0; j < selectedMedicineDetails.length; j++){
final addUpdateStock = Stock(selectedMedicineDetails[j]?.id, double.tryParse(unitPriceControllers[j].text), int.tryParse(quantityControllers[j].text));
      Provider.of<StockProvider>(context, listen: false)
          .insertUpdateStocks(addUpdateStock, selectedMedicineDetails[j]!.id ?? 0, int.tryParse(quantityControllers[j].text) ?? 0);
    }

    //temp
    Navigator.pop(context);
  }

  void _printPurchase() {}
}

class BuildTextFormField extends StatelessWidget {const BuildTextFormField({super.key,
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
      onChanged: onChange,
    );
  }
}
