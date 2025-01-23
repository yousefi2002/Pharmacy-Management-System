import 'package:fargard_pharmacy_management_system/medicines%20List/medicine_register_page.dart';
import 'package:fargard_pharmacy_management_system/modal_classes/medicines.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'crud_for_medicines.dart';

class MedicinesList extends StatefulWidget {
  const MedicinesList({super.key});

  @override
  _MedicinesListState createState() => _MedicinesListState();
}

class _MedicinesListState extends State<MedicinesList> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<MedicinesProvider>(context, listen: false).fetchMedicines();
    });
    return Scaffold(
      body: Consumer<MedicinesProvider>(
        builder: ( context, value, child) {
          final data = value.medicines;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: PaginatedDataTable(
                      actions: [
                        ElevatedButton(style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent),
                            onPressed:(){
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                  MedicineRegisterPage(Medicine(null, '', '', '', 0.0,  '', '')),));
                            },
                            child:Text(AppLocalizations.of(context)!.nnew,style: TextStyle(color: Colors.black),)),
                        const SizedBox(width: 100,),
                        Text(AppLocalizations.of(context)!.start_date,style: TextStyle(fontSize: 18),),
                        SizedBox(
                          width: 120,
                          height: 30,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(AppLocalizations.of(context)!.end_date,style: TextStyle(fontSize: 18)),
                        SizedBox(
                          width: 120,
                          height: 30,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightGreenAccent
                            ),
                            onPressed:(){
                            },
                            child:Text(AppLocalizations.of(context)!.filter,style: TextStyle(fontSize: 18,color: Colors.black))),
                        SizedBox(width: 10,),
                        Text(AppLocalizations.of(context)!.search_by),
                        SizedBox(
                          width: 120,
                          height: 30,
                          child: TextFormField(
                            controller: _searchController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ],

                      source: MyData(data, context),
                      columns: [
                        const DataColumn(label: Text("ID")),
                        DataColumn(label: Text(AppLocalizations.of(context)!.medicine_name)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.description)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.category)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.price)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.generic_name)),
                        const DataColumn(label: Text('company Id')),
                        const DataColumn(label: Text("")),
                      ],
                      header: Center(child: Text(AppLocalizations.of(context)!.medicine_list)),
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
    final medicine = value[index];
    return DataRow(
        cells: [
          DataCell(Text(medicine.id.toString()),),
          DataCell(Text(medicine.name),),
          DataCell(Text(medicine.description)),
          DataCell(Text(medicine.type)),
          DataCell(Text(medicine.pricePerUnit.toString())),
          DataCell(Text(medicine.genericId)),
          DataCell(Text(medicine.companyId)),
          DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('delete'),
                    content: const Text("are_you_sure?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Provider.of<MedicinesProvider>(context, listen: false)
                              .deleteMedicine(medicine.id ?? 0);
                          Navigator.of(context).pop();
                        },
                        child: const Text('delete'),
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
                  builder: (context) => MedicineRegisterPage(medicine), // Passing the current patient object
                ),
              );
            },
          ), ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => value.length;

  @override
  int get selectedRowCount => 0;
}
