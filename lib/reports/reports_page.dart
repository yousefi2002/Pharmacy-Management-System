import 'package:fargard_pharmacy_management_system/doctors_page/doctprs_List_page.dart';
import 'package:fargard_pharmacy_management_system/reports/employee_reports_page.dart';
import 'package:fargard_pharmacy_management_system/purches_page/purchese_List_page.dart';
import 'package:fargard_pharmacy_management_system/salse_page/salse_List_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../medicines List/medicine_register_page.dart';
class All_reports_page extends StatefulWidget {
  const All_reports_page({super.key});

  @override
  State<All_reports_page> createState() => _All_reports_pageState();
}

class _All_reports_pageState extends State<All_reports_page> {
  List<Map<String, dynamic>> pages(BuildContext context) => [
    {
      "name": AppLocalizations.of(context)!.purchase_reports,
      "icon": Icon(Icons.add_chart),
      "navigate": Purchese_List_page(),
    },
    {
      "name": AppLocalizations.of(context)!.sales_reports,
      "icon": Icon(Icons.pending_actions),
      "navigate": Sales_List_page(),
    },
    {
      "name": AppLocalizations.of(context)!.employee_reports,
      "icon": Icon(Icons.add_reaction),
      "navigate": Employee_reports_page(),
    },
    {
      "name": AppLocalizations.of(context)!.doctor_reports,
      "icon": Icon(Icons.bar_chart),
      "navigate": Doctors_List_page(),
    },
    {
      "name": AppLocalizations.of(context)!.expense_reports,
      "icon": Icon(Icons.add_card_outlined),
      "navigate": Medicine_register_page(),
    },
    {
      "name": AppLocalizations.of(context)!.total_income_expenses,
      "icon": Icon(Icons.add_card_outlined),
      "navigate": Medicine_register_page(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    final pagesList = pages(context);
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.fromLTRB(500, 100, 500, 100),
        child: Container(
          child: ListView.builder(
            itemCount: pagesList.length,
            itemBuilder:(context, index) {
            return Card(
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: CupertinoColors.white,)
              ),
              child: ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => pagesList[index]["navigate"],),);
                },
                title: Center(child: Text(pagesList[index]["name"],style: TextStyle(fontSize: 24),),),
              ),
            );
          },),
        ),
      )
    );
  }
}
