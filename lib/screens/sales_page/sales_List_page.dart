import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'sales_page.dart';

class Sales_List_page extends StatefulWidget {
  @override
  _Sales_List_pageState createState() => _Sales_List_pageState();
}

class _Sales_List_pageState extends State<Sales_List_page> {
  final mydata _myDate = mydata();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _filterData(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _myDate.filterData(_searchQuery);
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
            Text(AppLocalizations.of(context)!.sales_invoices, style: const TextStyle(fontSize: 30),),
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
                        builder: (context) => SalesPage(),
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
                source: _myDate,
                columns: [
                  const DataColumn(label: Text("#")),
                  DataColumn(label: Text(AppLocalizations.of(context)!.patient_name)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.seller)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.prescription_number)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.sale_date)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.total_price)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.total_price)),
                  const DataColumn(label: Text("")),
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

class mydata extends DataTableSource {
  List<Map<String, String>> _prescriptions = [];

  List<Map<String, String>> _filteredPrescriptions = [];

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
      DataCell(Text(prescription["number"] ?? '')),
      DataCell(Text(prescription["patient_name"] ?? '')),
      DataCell(Text(prescription["patient_name"] ?? '')),
      DataCell(Text(prescription["contact_number"] ?? '')),
      DataCell(Text(prescription["prescription_number"] ?? '')),
      DataCell(Text(prescription["total_amount"] ?? '')),
      DataCell(Text(prescription["total_amount"] ?? '')),
      DataCell(Row(
        children: [
          IconButton(onPressed:(){}, icon:Icon(Icons.delete,color: Colors.red,),),
          IconButton(onPressed:(){}, icon:Icon(Icons.edit_note_outlined,color: Colors.blue,),),
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
