import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class Employee_reports_page extends StatefulWidget {
  @override
  _Employee_reports_pageState createState() => _Employee_reports_pageState();
}

class _Employee_reports_pageState extends State<Employee_reports_page> {
  final mydata _mydata = mydata();
  final TextEditingController _searchController = TextEditingController();
  TextEditingController textEditingController=TextEditingController();
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
            Text(AppLocalizations.of(context)!.employee_reports, style: TextStyle(fontSize: 30),),
            const Expanded(child: SizedBox()),
            Expanded(
              child: SearchBarAnimation(
                onChanged:(value){
                  _filterData(value);
                },
                  textEditingController: textEditingController,
                  isOriginalAnimation: true,
                  enableKeyboardFocus: true,
                  trailingWidget: Icon(Icons.search,color: Colors.black,),
                  secondaryButtonWidget:Icon(Icons.close,color: Colors.black,),
                  buttonWidget:Icon(Icons.search,color: Colors.black,)
              ),
            ),
            const SizedBox(width: 8),
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
                showEmptyRows: true,
                source: _mydata,
                columns: [
                  DataColumn(label: Container(width:20,child: Text("#"))),
                  DataColumn(label: Text(AppLocalizations.of(context)!.employee_name)),
                  DataColumn(label: Container(width:80,child: Text(AppLocalizations.of(context)!.salesamount))),
                  DataColumn(label: Container(width:80,child: Text(AppLocalizations.of(context)!.prescription_count))),
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
  List<Map<String, String>> _prescriptions = [
   {"number": "2", "patient_name": "Patient B", "contact_number": "0987654321", "prescription_number": "RX002", "total_amount": "1500", "paid_amount": "1400"},
  ];

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
      DataCell(Text(prescription["contact_number"] ?? '')),
      DataCell(Text(prescription["prescription_number"] ?? '')),
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
