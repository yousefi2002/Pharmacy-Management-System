import 'package:fargard_pharmacy_management_system/screens/purches_page/purchese_List_page.dart';
// import 'package:fargard_pharmacy_management_system/screens/roznamcha.dart';
import 'package:fargard_pharmacy_management_system/screens/sales_page/sales_List_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'doctors_page/doctprs_List_page.dart';

class All_reports_page extends StatefulWidget {
  const All_reports_page({super.key});

  @override
  State<All_reports_page> createState() => _All_reports_pageState();
}

class _All_reports_pageState extends State<All_reports_page> {
  List<Map<String, dynamic>> pages(BuildContext context) => [
    {
      "name":"roznamcha",
      "icon": Icon(Icons.add_card_outlined),
      // "navigate": Roznamcha(),
    },
    {
      "name": AppLocalizations.of(context)!.purchase_reports,
      "icon": Icon(Icons.add_chart),
      "navigate": PurchaseListPage(),
    },
    {
      "name": AppLocalizations.of(context)!.sales_reports,
      "icon": Icon(Icons.pending_actions),
      "navigate": SalesListPage(),
    },
    {
      "name": AppLocalizations.of(context)!.employee_reports,
      "icon": Icon(Icons.add_reaction),
      // "navigate": Employee_reports_page(),
    },
    {
      "name": AppLocalizations.of(context)!.doctor_reports,
      "icon": Icon(Icons.bar_chart),
      "navigate": Doctors_List_page(),
    },
    {
      "name": AppLocalizations.of(context)!.expense_reports,
      "icon": Icon(Icons.add_card_outlined),
      // "navigate": MedicineRegisterPage(),
    },
    {
      "name": AppLocalizations.of(context)!.total_income_expenses,
      "icon": Icon(Icons.add_card_outlined),
      // "navigate": MedicineRegisterPage(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    final pagesList = pages(context);
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.fromLTRB(500, 100, 500, 100),
        child: Container(
          child: ListView.builder(
            itemCount: pagesList.length,
            itemBuilder:(context, index) {
            return Card(
              child: ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => pagesList[index]["navigate"],));
                },
                title: Center(child: Text(pagesList[index]["name"])),
              ),
            );
          },),
        ),
      )
    );
  }
}
