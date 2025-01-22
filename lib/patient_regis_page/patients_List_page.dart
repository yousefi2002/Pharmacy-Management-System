import 'package:fargard_pharmacy_management_system/patient_regis_page/crud_for_patients.dart';
import 'package:fargard_pharmacy_management_system/patient_regis_page/patient_regis_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../modal_classes/patients.dart';

class PatientsListPage extends StatefulWidget {
  const PatientsListPage({super.key});

  @override
  _PatientsListPageState createState() => _PatientsListPageState();
}

class _PatientsListPageState extends State<PatientsListPage> {

  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<PatientProvider>(context, listen: false).fetchPatient();
    });
    return Scaffold(
      body: Consumer<PatientProvider>(
        builder: (context, value, child) {
          final data = value.patients;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: PaginatedDataTable(
                      actions: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddPatientPage(Patient(null ,'', '', ''),),
                                  ));
                            },
                            child: Text(
                              AppLocalizations.of(context)!.nnew,
                              style: const TextStyle(color: Colors.black),
                            )),
                        const SizedBox(
                          width: 100,
                        ),
                        Text(
                          AppLocalizations.of(context)!.start_date,
                          style: const TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          width: 120,
                          height: 30,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(AppLocalizations.of(context)!.end_date,
                            style: const TextStyle(fontSize: 18)),
                        SizedBox(
                          width: 120,
                          height: 30,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightGreenAccent),
                            onPressed: () {
                            },
                            child: Text(AppLocalizations.of(context)!.filter,
                                style: const TextStyle(fontSize: 18))),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(AppLocalizations.of(context)!.search_by),
                        SizedBox(
                          width: 120,
                          height: 30,
                          child: TextFormField(
                            controller: _searchController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ],
                      source: MyData(data, context),
                      columns: [
                        const DataColumn(
                            label: Text("ID")),
                        DataColumn(
                            label: Text(AppLocalizations.of(context)!.patient_name)),
                        DataColumn(
                            label: Text(AppLocalizations.of(context)!.address)),
                        DataColumn(
                            label: Text(AppLocalizations.of(context)!.contact_number)),
                        const DataColumn(
                            label: Text("")),
                      ],
                      header: Center(
                          child: Text(
                              AppLocalizations.of(context)!.patient_list)),
                      columnSpacing: 130,
                      horizontalMargin: 40,
                    ),
                  ),
                ),
              ],
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
      DataCell(Text(patient.contactNumber)),
      DataCell(Text(patient.address)),
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
                    builder: (context) => AddPatientPage(patient), // Passing the current patient object
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ]);
  }
  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => value.length;

  @override
  int get selectedRowCount => 0;
}
