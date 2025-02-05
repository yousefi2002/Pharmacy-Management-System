import '../../models/medicines.dart';
import '../../models/stocks.dart';
import '../../models/users.dart';
import '../../providers/crud_for_medicines.dart';
import '../../providers/crud_for_stock.dart';
import '../../utilities/date_time_format.dart';
import '../purches_page/Purchase_page.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  final _invoiceNumberController = TextEditingController();
  List<String?> selectedMedicines = [];
  List<Medicine?> selectedMedicineDetails = [];
  final List<TextEditingController> quantityControllers = [];
  final List<TextEditingController> unitPriceControllers = [];
  final List<TextEditingController> discountControllers = [];
  final List<double> totalPriceForEachSelections = [];
  final List<double> totalDiscountForEachSelections = [];

  Customer? customer;
  User? user;
  String? date;
  double? saleTotalPrice = 0;
  double? discountTotalPrice = 0;
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
      Provider.of<CustomerProvider>(context, listen: false).fetchCustomers();
      Provider.of<UserProvider>(context, listen: false).fetchUser();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 15,
          children: [
            const Text("Sales Page"),
            const Expanded(child: SizedBox()),
            Expanded(
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the sell price';
                  }
                  return null;
                },
                selectionHeightStyle: BoxHeightStyle.includeLineSpacingMiddle,
                controller: _invoiceNumberController,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(focs4);
                },
                decoration: MyInputDecoration1(labelText: 'Invoice Number', hintText: 'Name Like #123'),
                style: const TextStyle(
                  color: Colors.black, // Input text color
                  fontSize: 18,
                ),
              ),
            ),
            Consumer<CustomerProvider>(
                builder: (context, customerProvider, child) {
                  return DropdownButton2<Customer>(
                    items: customerProvider.customer
                        .map(
                          (customer) => DropdownMenuItem<Customer>(
                        value: customer,
                        child: Center(child: Text(customer.name)),
                      ),
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        customer = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      width: 210,
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: const Border(top: BorderSide(color: Colors.greenAccent),bottom: BorderSide(color: Colors.greenAccent),right: BorderSide(color: Colors.greenAccent), left: BorderSide(color: Colors.greenAccent)),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green.shade50, // Dropdown background color
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        border: const Border(top: BorderSide(color: Colors.green),bottom: BorderSide(color: Colors.green),right: BorderSide(color: Colors.green), left: BorderSide(color: Colors.green)),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white, // Dropdown background color
                      ),
                    ),
                    hint: Center(child: Text(customer?.name ?? 'Customer Name')),
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
            Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  return DropdownButton2<User>(
                    items: userProvider.users
                        .map(
                          (customer) => DropdownMenuItem<User>(
                        value: customer,
                        child: Center(child: Text(customer.name)),
                      ),
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        user = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      width: 210,
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: const Border(top: BorderSide(color: Colors.greenAccent),bottom: BorderSide(color: Colors.greenAccent),right: BorderSide(color: Colors.greenAccent), left: BorderSide(color: Colors.greenAccent)),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green.shade50, // Dropdown background color
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        border: const Border(top: BorderSide(color: Colors.green),bottom: BorderSide(color: Colors.green),right: BorderSide(color: Colors.green), left: BorderSide(color: Colors.green)),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white, // Dropdown background color
                      ),
                    ),
                    hint: Center(child: Text(user?.name ?? 'User Name')),
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
                              '${AppLocalizations.of(context)!.discount} :  $discountTotalPrice AFG'),
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
                      ElevatedButton(
                        onPressed: () async {
                          selectedMedicineDetails.clear();
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.cancel),
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
    discountControllers.add(TextEditingController());
    totalPriceForEachSelections.add(0);
    totalDiscountForEachSelections.add(0);
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
    totalDiscountForEachSelections[index] = discount!;
    saleTotalPrice = totalPriceForEachSelections.reduce((x, y) => x + y);
    discountTotalPrice = totalDiscountForEachSelections.reduce((x, y) => x + y);
  }

  void _savePurchase(context, List<Medicine?> medicine, int index) async {
    //step #1
    Provider.of<SalesProvider>(context, listen: false)
        .addSales(Sales(
      customer?.id,_invoiceNumberController.text, user?.id, date, discountTotalPrice, saleTotalPrice,),);

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
                selectedMedicineDetails[i]?.id,
                lastInsertedSalesId,
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

