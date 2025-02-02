import 'package:fargard_pharmacy_management_system/screens/visit_page/visit_regis_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class DoctorsReports extends StatefulWidget {
  @override
  _DoctorsReportsState createState() => _DoctorsReportsState();
}

class _DoctorsReportsState extends State<DoctorsReports> {
  final mydata _mydata = mydata();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime now = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.doctor_reports, style: const TextStyle(fontSize: 30),),
            const Expanded(child: SizedBox()),
            // Text Search Bar
            Expanded(
              child: TextFormField(
                controller: _startDateController,
                readOnly: true,
                onTap:()=> _selectDate(context,_startDateController),
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.start_date,
                  labelStyle: const TextStyle(
                    color: Colors.green, // Label text color
                    fontSize: 16,
                  ),
                  hintText: '',
                  hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), // Rounded border
                    borderSide: const BorderSide(
                      color: Colors.greenAccent, // Border color when not focused
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), // Rounded border
                    borderSide: const BorderSide(
                      color: Colors.green, // Border color when focused
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.red, // Border color on error
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.redAccent, // Border color on focused error
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ), // Inner padding
                  filled: true,
                  fillColor: Colors.green.shade50, // Background color
                ),
                style: const TextStyle(
                  color: Colors.black, // Input text color
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                controller: _endDateController,
                readOnly: true,
                onTap:()=> _selectDate(context,_endDateController),
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.end_date,
                  labelStyle: const TextStyle(
                    color: Colors.green, // Label text color
                    fontSize: 16,
                  ),
                  hintText: '',
                  hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), // Rounded border
                    borderSide: const BorderSide(
                      color: Colors.greenAccent, // Border color when not focused
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5), // Rounded border
                    borderSide: const BorderSide(
                      color: Colors.green, // Border color when focused
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.red, // Border color on error
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.redAccent, // Border color on focused error
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ), // Inner padding
                  filled: true,
                  fillColor: Colors.green.shade50, // Background color
                ),
                style: const TextStyle(
                  color: Colors.black, // Input text color
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.search,
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
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              child:SizedBox(
                width: double.infinity,
                height: 200,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("تعداد مریضان  ${100}؋",style: TextStyle(color: Colors.blue,fontSize: 20),),
                          Text("تعداد نسخه ها  ${75}؋",style: TextStyle(color: Colors.orange,fontSize: 20),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              value: 100,
                              title: '100',
                              color: Colors.blue,
                              radius: 50,
                              titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            PieChartSectionData(
                              value: 75,
                              title: '75',
                              color: Colors.orange,
                              radius: 50,
                              titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(" مجموع قیمت کل نسخه ها  ${25000}؋",style: TextStyle(color: Colors.blue,fontSize: 20),),
                          Text("  مجموعه قیمت کل فیس ها  ${12000} ؋",style: TextStyle(color: Colors.orange,fontSize: 20),),
                        ],
                      ),
                    ),
                    Expanded(
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              value: 25000,
                              title: '2500 ؋',
                              color: Colors.blue,
                              radius: 50,
                              titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            PieChartSectionData(
                              value: 12000,
                              title: "12000 ؋",
                              color: Colors.orange,
                              radius: 50,
                              titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: PaginatedDataTable(
                    showEmptyRows: true,
                    source: _mydata,
                    columns: [
                      DataColumn(label: Container(width:20,child: Text("#"))),
                      DataColumn(label: Text(AppLocalizations.of(context)!.doctor_name)),
                      DataColumn(label: Text(AppLocalizations.of(context)!.number_of_patients)),
                      DataColumn(label: Container(width:80,child: Text(AppLocalizations.of(context)!.prescription_count))),
                      DataColumn(label: Container(width:80,child: Text(AppLocalizations.of(context)!.fee_amount))),
                      DataColumn(label: Container(width:80,child: Text(AppLocalizations.of(context)!.prescription_amount))),
                      DataColumn(label: Container(width:80,child: Text(""))),
                    ],
                    columnSpacing: 50,
                    horizontalMargin: 40,
                    showFirstLastButtons: true,
                  ),
                ),
              ),
            ),
          ],
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
      DataCell(Text(prescription["patient_name"] ?? '')),
      DataCell(Text(prescription["contact_number"] ?? '')),
      DataCell(Text(prescription["prescription_number"] ?? '')),
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
