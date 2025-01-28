import 'package:fargard_pharmacy_management_system/screens/patient_regis_page/patient_regis_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../models/patients.dart';
import '../../providers/crud_for_patients.dart';

class PatientsListPage extends StatefulWidget {
  const PatientsListPage({super.key});

  @override
  _PatientsListPageState createState() => _PatientsListPageState();
}

class _PatientsListPageState extends State<PatientsListPage> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<PatientProvider>(context, listen: false).fetchPatient();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.patients, style: const TextStyle(fontSize: 30),),
            const Expanded(child: SizedBox()),
            // Text Search Bar
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
                        builder: (context) => AddPatientPage(Patient(null, '', null, '',)),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(AppLocalizations.of(context)!.register_patient),
                ),
            ),
          ],
        ),
      ),
      body: Consumer<PatientProvider>(
        builder: (context, value, child) {
          final data = value.patients;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: PaginatedDataTable(
                    showCheckboxColumn: true,
                    showEmptyRows: true,
                    source: MyData(data, context),
                    columns: [
                      const DataColumn(label: Text("ID")),
                      DataColumn(label: Text(AppLocalizations.of(context)!.patient_name)),
                      DataColumn(label: Text(AppLocalizations.of(context)!.address)),
                      DataColumn(label: Text(AppLocalizations.of(context)!.contact_number)),
                      const DataColumn(
                          label: Text("")),
                    ],
                    columnSpacing: 50,
                    horizontalMargin: 40,
                    showFirstLastButtons: true,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyData extends DataTableSource {
  var value;
  final BuildContext context;
  MyData(this.value, this.context);
  @override
  DataRow getRow(int index) {
    Patient patient = value[index];
    return DataRow(cells: [
      DataCell(Text('${patient.id}')),
      DataCell(Text(patient.name)),
      DataCell(Text(patient.address)),
      DataCell(Text(patient.contactNumber)),
      DataCell(
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('delete'),
                      content: Text("are_you_sure?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<PatientProvider>(context, listen: false)
                                .deletePatient(patient.id ?? 0);
                            Navigator.of(context).pop();
                          },
                          child: Text('delete'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit_note_outlined, color: Colors.blue),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPatientPage(patient),),);
              },
            ),
          ],
        ),
      ),
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
