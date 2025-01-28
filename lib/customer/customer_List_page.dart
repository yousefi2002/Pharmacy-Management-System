import 'dart:math';

import 'package:fargard_pharmacy_management_system/customer/customer_regis_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Customer_List_page extends StatefulWidget {
  @override
  _Customer_List_pageState createState() => _Customer_List_pageState();
}

class _Customer_List_pageState extends State<Customer_List_page> {
  final CustomersDataTableSource _mydata = CustomersDataTableSource();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  void _filterData(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _mydata.filterData(_searchQuery);
    });
  }
  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterData(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.customer_list, style: const TextStyle(fontSize: 30),),
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
                        builder: (context) => Customer_regis_page(),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "Add Customer",
                  ),
                )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: PaginatedDataTable(
                showCheckboxColumn: true,
                showEmptyRows: true,
                source: _mydata,
                columns: [
                  DataColumn(label: Container(width: 10, child: Text("#",))),
                  DataColumn(
                      label:
                          Text(AppLocalizations.of(context)!.customer_name)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.age)),
                  DataColumn(
                      label: Container(
                          width: 80,
                          child: Text(AppLocalizations.of(context)!.gender))),
                  DataColumn(
                      label: Container(
                          width: 80,
                          child: Text(
                              AppLocalizations.of(context)!.contact_number))),
                  DataColumn(
                      label: Container(
                          width: 80,
                          child:
                              Text(AppLocalizations.of(context)!.address))),
                  DataColumn(label: Container(width: 80, child: Text(""))),
                ],
                columnSpacing: 50,
                horizontalMargin: 40,
                showFirstLastButtons: true,

              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomersDataTableSource extends DataTableSource {

  // List<Map<String, String>> _filteredPrescriptions = [];
  List<Map<String, String>> _prescriptions = [];
  List<Map<String, String>> _filteredPrescriptions = List.generate(50, (index) {
    final random = Random();
    return {
      "customer_id": (index + 1).toString(),
      "customer_name": "Customer ${index + 1}",
      "customer_contact_number": "123-456-78${random.nextInt(10)}${random.nextInt(10)}",
      "customer_age": (20 + random.nextInt(40)).toString(),
      "customer_gender": random.nextBool() ? "Male" : "Female",
      "customer_address": "Address ${index + 1}, City ${random.nextInt(100)}",
    };
  });

  void filterData(String query) {
    if (query.isEmpty) {
      _filteredPrescriptions = List.from(_prescriptions);
    } else {
      _filteredPrescriptions = _prescriptions.where((item) {
        return item.values.any((value) => value.toLowerCase().contains(query));
      }).toList();
    }
    notifyListeners();
  }

  @override
  DataRow getRow(int index) {
    final prescription = _filteredPrescriptions[index];
    return DataRow(cells: [
      DataCell(Text(prescription["customer_id"] ?? '',), onTap: (){}),
      DataCell(Text(prescription["customer_name"] ?? '')),
      DataCell(Text(prescription["customer_contact_number"] ?? '')),
      DataCell(Text(prescription["customer_age"] ?? '')),
      DataCell(Text(prescription["customer_gender"] ?? '')),
      DataCell(Text(prescription["customer_address"] ?? '')),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit_note_outlined,
              color: Colors.blue,
            ),
          ),
        ],
      )),
    ],
      color: MaterialStateProperty.all(Colors.grey.shade200)
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _filteredPrescriptions.length;

  @override
  int get selectedRowCount => 0;
}
