import 'package:fargard_pharmacy_management_system/expenses_page/expenses_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../modal_classes/expenses.dart';
import 'crud_for_expenses.dart';

class ExpensesListPage extends StatefulWidget {
  const ExpensesListPage({super.key});

  @override
  _ExpensesListPageState createState() => _ExpensesListPageState();
}

class _ExpensesListPageState extends State<ExpensesListPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<ExpensesProvider>(context, listen: false).fetchExpense();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.expenses, style: const TextStyle(fontSize: 30),),
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
                        builder: (context) => ExpensesPage(Expenses(null, '', null, '', null)),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(AppLocalizations.of(context)!.record_expenses),
                )),
          ],
        ),
      ),
      body: Consumer<ExpensesProvider>(
        builder: (context, value, child) {
          final data = value.expenses;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: PaginatedDataTable(
                    source: MyData(data, context),
                    columns: [
                      const DataColumn(label: Text("ID")),
                      DataColumn(label: Text(AppLocalizations.of(context)!.description)),
                      DataColumn(label: Text(AppLocalizations.of(context)!.amount)),
                      DataColumn(label: Text(AppLocalizations.of(context)!.date)),
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
    final expense = value[index];
    return DataRow(cells: [
      DataCell(Text(expense.id.toString())),
      DataCell(Text(expense.description)),
      DataCell(Text(expense.amount.toString())),
      DataCell(Text(expense.date)),
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
                          Provider.of<ExpensesProvider>(context, listen: false)
                              .deleteExpenses(expense.id ?? 0);
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
                  builder: (context) => ExpensesPage(expense), // Passing the current patient object
                ),
              );
            },
          ),
        ],
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
