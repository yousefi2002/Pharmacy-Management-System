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
      body: Consumer<UserProvider>(
        builder: (context,  value, child) {
          final data = value.users;
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => UsersRegisterPage(User(null, '', '', '', '')),));
                            },
                            child:Text(AppLocalizations.of(context)!.nnew,style: TextStyle(color: Colors.black),)),
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
                            child:Text(AppLocalizations.of(context)!.filter,style: TextStyle(fontSize: 18))),
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
                        DataColumn(label: Container(width:20,child: Text("Id"))),
                        DataColumn(label: Text(AppLocalizations.of(context)!.username)),
                        DataColumn(label: Text(AppLocalizations.of(context)!.role)),
                        DataColumn(label: Container(width:80,child: Text(AppLocalizations.of(context)!.contact_number))),
                        DataColumn(label: Container(width:80,child: Text('email'))),
                        DataColumn(label: Container(width:80,child: Text(""))),
                      ],
                      header: Center(child: Text(AppLocalizations.of(context)!.employee_list)),
                      columnSpacing: 150,
                      horizontalMargin: 100,
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
