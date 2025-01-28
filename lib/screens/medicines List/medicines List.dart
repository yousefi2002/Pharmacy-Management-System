import 'package:fargard_pharmacy_management_system/providers/crud_for_company_name.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_generic_name.dart';
import 'package:fargard_pharmacy_management_system/screens/companies/companies_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../models/medicines.dart';
import '../../providers/crud_for_medicines.dart';
import '../generic_names/generic_names_list.dart';
import 'medicine_register_page.dart';

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
      Provider.of<GenericNameProvider>(context, listen: false).fetchGeneric();
      Provider.of<CompanyProvider>(context, listen: false).fetchCompanies();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.medicines, style: const TextStyle(fontSize: 30),),
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
                        builder: (context) => MedicineRegisterPage(Medicine(null, '', '', '', null, '', '', '', ''))),);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(AppLocalizations.of(context)!.register_medicine),
                ),),
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
                      builder: (context) => const GenericNameList()),);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(AppLocalizations.of(context)!.generic_names),
              ),),
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
                      builder: (context) =>  const CompaniesList()),);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(AppLocalizations.of(context)!.companies),
              ),),
          ],
        ),
      ),
      body: Consumer<MedicinesProvider>(
        builder: ( context, value, child) {
          final data = value.medicines;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: PaginatedDataTable(
                  showCheckboxColumn: true,
                  showEmptyRows: true,
                  source: MyData(data, context),
                  columns: [
                    const DataColumn(label: Text("ID")),
                    DataColumn(label: Text(AppLocalizations.of(context)!.medicine_name)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.description)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.category)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.price)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.generic_names)),
                    const DataColumn(label: Text('company Id')),
                    const DataColumn(label: Text("")),
                  ],
                  columnSpacing: 130,
                  horizontalMargin: 40,
                  showFirstLastButtons: true,
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

    ],
        color: WidgetStateProperty.all(Colors.grey.shade200)
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => value.length;

  @override
  int get selectedRowCount => 0;
}
