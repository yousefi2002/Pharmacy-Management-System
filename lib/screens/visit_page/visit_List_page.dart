import 'package:fargard_pharmacy_management_system/screens/visit_page/visit_regis_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../models/visits.dart';
import '../../providers/crud_for_patients.dart';
import 'package:flutter/services.dart';
class VisitListPage extends StatefulWidget {
  @override
  _VisitListPageState createState() => _VisitListPageState();
}

class _VisitListPageState extends State<VisitListPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Visits> filteredData = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<VisitProvider>(context, listen: false);
      setState(() {
        filteredData = provider.visits;
      });
    });
  }

  void goBack() {
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.backspace): GoBackIntent(),
      },
      child: Actions(
        actions: {
          GoBackIntent:CallbackAction<GoBackIntent>(onInvoke: (intent)=>goBack())
        },
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Text(AppLocalizations.of(context)!.visits, style: const TextStyle(fontSize: 30),),
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
                            builder: (context) => VisitPage(Visits(null, '', null, '',null, '', null, '',null)),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(AppLocalizations.of(context)!.visit),
                    )),
              ],
            ),
          ),
          body: Consumer<VisitProvider>(
            builder: (context, value, child) {
              final data = value.visits;
              return Padding(
                padding:  EdgeInsets.all(8.0),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: PaginatedDataTable(
                        showEmptyRows: true,
                        source: MyData1(data, context),
                        columns: [
                          DataColumn(label: Container(width: 20, child: Text(AppLocalizations.of(context)!.id))),
                          DataColumn(label: Text(AppLocalizations.of(context)!.patient_name)),
                          DataColumn(label: Text(AppLocalizations.of(context)!.age)),
                          DataColumn(label: Container(width: 80, child: Text(AppLocalizations.of(context)!.gender))),
                          DataColumn(label: Container(width: 80, child: Text(AppLocalizations.of(context)!.contact_number))),
                          DataColumn(label: Container(width: 80, child: Text(AppLocalizations.of(context)!.doctor_name))),
                          DataColumn(label: Container(width: 80, child: Text(AppLocalizations.of(context)!.amount))),
                          DataColumn(label: Container(width: 80, child: Text(AppLocalizations.of(context)!.time))),
                          DataColumn(label: Container(width: 80, child: Text(AppLocalizations.of(context)!.date))),
                          DataColumn(label: Container(width: 80, child: Text(""))),
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
        ),
      ),
    );
  }
}

class MyData1 extends DataTableSource {
  final List<Visits> value;
  final BuildContext context;
  MyData1(this.value, this.context);
  @override
  DataRow getRow(int index) {
    Visits visits = value[index];
    return DataRow(cells: [
      DataCell(Text('${index+1}')),
      DataCell(Text(visits.patientName)),
      DataCell(Text(visits.age)),
      DataCell(Text(visits.gender)),
      DataCell(Text(visits.contactNumber)),
      DataCell(Text(visits.doctorName)),
      DataCell(Text(visits.fees)),
      DataCell(Text(visits.time)),
      DataCell(Text(visits.date)),
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
                          Provider.of<VisitProvider>(context, listen: false)
                              .deleteVisits(visits.id ?? 0);
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
          IconButton(onPressed:()async{
            await Navigator.push(context, MaterialPageRoute(builder: (context) => VisitPage(visits),));

          }, icon:Icon(Icons.edit_note_outlined,color: Colors.blue,),),
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
class GoBackIntent extends Intent {}