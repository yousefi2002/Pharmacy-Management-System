import 'package:fargard_pharmacy_management_system/doctors_page/crud_for_doctor.dart';
import 'package:fargard_pharmacy_management_system/doctors_page/doctor_register_page.dart';
import 'package:fargard_pharmacy_management_system/modal_classes/doctors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Doctors_List_page extends StatefulWidget {
  const Doctors_List_page({super.key});

  @override
  _Doctors_List_pageState createState() => _Doctors_List_pageState();
}

class _Doctors_List_pageState extends State<Doctors_List_page> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.doctors, style: const TextStyle(fontSize: 30),),
            const Expanded(child: SizedBox()),
            // Text Search Bar
            Expanded(
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText:  AppLocalizations.of(context)!.search,
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
                        builder: (context) => DoctorPage(Doctor(null, '', null, '', null)),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(AppLocalizations.of(context)!.register_doctor),
                )),
          ],
        ),
      ),
      body: Consumer<DoctorProvider>(
        builder: (context,value,child) {
          final date = value.doctor;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: PaginatedDataTable(
                    showCheckboxColumn: true,
                    showEmptyRows: true,
                    source: MyDate(date, context),
                    columns: [
                       DataColumn(label: Text("#"),),
                      DataColumn(label: Text(AppLocalizations.of(context)!.doctor_name),),
                      DataColumn(label: Text(AppLocalizations.of(context)!.specialty),),
                      DataColumn(label: Text(AppLocalizations.of(context)!.contact_number),),
                      DataColumn(label: Text(""),),
                    ],
                    columnSpacing: 50,
                    horizontalMargin: 40,
                    showFirstLastButtons: true,
                  ),
                ),
              ),
            ),
          );
        } ),
    );
  }
}

class MyDate extends DataTableSource {
  var value;
  final BuildContext context;
  MyDate(this.value, this.context);

  @override
  DataRow getRow(int index) {
    final doctor = value[index];
    return DataRow(cells: [
      DataCell(Text(doctor.id.toString())),
      DataCell(Text(doctor.name.toString())),
      DataCell(Text(doctor.role.toString())),
      DataCell(Text(doctor.contactNumber.toString())),
      DataCell(Row(
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(AppLocalizations.of(context)!.delete),
                      content:  Text(AppLocalizations.of(context)!.confirmDelete),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(AppLocalizations.of(context)!.no),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<DoctorProvider>(context, listen: false)
                                .deleteDoctor(doctor.id ?? 0);
                            Navigator.of(context).pop();
                          },
                          child:  Text(AppLocalizations.of(context)!.delete),
                        ),
                      ],
                    );
                  },);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: ()async {
              await Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => DoctorPage(doctor),));
            },
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
  int get rowCount => value.length;

  @override
  int get selectedRowCount => 0;
}
