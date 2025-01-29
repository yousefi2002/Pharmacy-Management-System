import 'package:fargard_pharmacy_management_system/models/generic_names.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_generic_name.dart';
import 'package:fargard_pharmacy_management_system/screens/generic_names/generic_name_register.dart';
import 'package:fargard_pharmacy_management_system/utilities/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class GenericNameList extends StatefulWidget {
  const GenericNameList({super.key});

  @override
  _GenericNameListState createState() => _GenericNameListState();
}

class _GenericNameListState extends State<GenericNameList> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<GenericNameProvider>(context, listen: false).fetchGeneric();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.generic_names, style: const TextStyle(fontSize: 30),),
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
                onChanged: (value){
                  Provider.of<GenericNameProvider>(context, listen: false).searchGeneric(value);
                },
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
                      builder: (context) => GenericNameRegisterPage(GenericName(null,''))),);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(AppLocalizations.of(context)!.register_generic),
              ),),
          ],
        ),
      ),
      body: Consumer<GenericNameProvider>(
        builder: ( context, value, child) {
          final data = value.genericName;
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
                    DataColumn(label: Text(AppLocalizations.of(context)!.id)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.generic_name)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.created_at)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.updated_at)),
                    DataColumn(label: Text(AppLocalizations.of(context)!.actions)),
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
    final genericName = value[index];
    return DataRow(
        cells: [
          DataCell(Text(genericName.id.toString()),),
          DataCell(Text(genericName.name),),
          DataCell(Text(formatLocalTime(genericName.createdAt))),
          DataCell(Text(formatLocalTime(genericName.updatedAt))),
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
                              Provider.of<GenericNameProvider>(context, listen: false)
                                  .deleteGeneric(genericName.id ?? 0);
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
                      builder: (context) => GenericNameRegisterPage(genericName), // Passing the current patient object
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
