import 'package:fargard_pharmacy_management_system/users_page/users_resgis_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../modal_classes/users.dart';
import 'crud_for_users.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  _UsersListPageState createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<UserProvider>(context, listen: false).fetchUser();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.employee_list, style: const TextStyle(fontSize: 30),),
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
                        builder: (context) => UsersRegisterPage(User(null, '', null, '', null)),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text("new user"),
                )),
          ],
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context,  value, child) {
          final data = value.users;
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
                      const DataColumn(label: Text("Id")),
                      DataColumn(label: Text(AppLocalizations.of(context)!.username)),
                      DataColumn(label: Text(AppLocalizations.of(context)!.role)),
                      DataColumn(label: Text(AppLocalizations.of(context)!.contact_number)),
                      DataColumn(label: Text("email")),
                      const DataColumn(label: Text("")),
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
    final user = value[index];
    return DataRow(cells: [
      DataCell(Text(user.id.toString())),
      DataCell(Text(user.name)),
      DataCell(Text(user.role)),
      DataCell(Text(user.contactNumber)),
      DataCell(Text(user.email)),
      DataCell(Row(
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
                        Provider.of<UserProvider>(context, listen: false)
                            .deleteUser(user.id ?? 0);
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
                  builder: (context) => UsersRegisterPage(user), // Passing the current patient object
                ),
              );
            },
          ),],
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
