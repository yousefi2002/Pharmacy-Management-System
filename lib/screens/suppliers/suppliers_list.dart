import 'package:fargard_pharmacy_management_system/models/companies.dart';
import 'package:fargard_pharmacy_management_system/models/suppliers.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_company_name.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_supplier.dart';
import 'package:fargard_pharmacy_management_system/screens/companies/companies_register.dart';
import 'package:fargard_pharmacy_management_system/screens/suppliers/suppliers_register.dart';
import 'package:fargard_pharmacy_management_system/utilities/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SuppliersList extends StatefulWidget {
  const SuppliersList({super.key});

  @override
  _SuppliersListState createState() => _SuppliersListState();
}

class _SuppliersListState extends State<SuppliersList> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<SupplierProvider>(context, listen: false).fetchSuppliers();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.suppliers, style: const TextStyle(fontSize: 30),),
            //
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
                onChanged: (value) {
                  Provider.of<SupplierProvider>(context, listen: false)
                      .searchSuppliers(value);
                },
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SupplierRegister(Supplier.empty())),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(AppLocalizations.of(context)!.new_supplier),
              ),
            ),
          ],
        ),
      ),
      body: Consumer<SupplierProvider>(
        builder: (context, value, child) {
          final data = value.suppliers;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: SingleChildScrollView(
                      child: PaginatedDataTable(
                        showCheckboxColumn: true,
                        showEmptyRows: true,
                        source: MyData(data, context),
                        columns: [
                          DataColumn(label: Text(AppLocalizations.of(context)!.id)),
                          DataColumn(
                              label: Text(AppLocalizations.of(context)!.supplier_name)),
                          DataColumn(
                              label:
                              Text(AppLocalizations.of(context)!.contact_number)),
                          DataColumn(label: Text(AppLocalizations.of(context)!.email)),
                          DataColumn(
                              label: Text(AppLocalizations.of(context)!.address)),
                          DataColumn(
                              label: Text(AppLocalizations.of(context)!.actions)),
                        ],
                        columnSpacing: 50,
                        horizontalMargin: 20,
                        showFirstLastButtons: true,
                      ),
                    ),
                  ),
                );
              },
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
    final supplier = value[index];

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
                  builder: (context) => SupplierRegister(
                      supplier), // Passing the current patient object
                ),
              );
            },
          ),
        ],
      )),
    ], color: WidgetStateProperty.all(Colors.grey.shade200));
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => value.length;

  @override
  int get selectedRowCount => 0;
}
