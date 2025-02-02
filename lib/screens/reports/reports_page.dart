
import 'package:fargard_pharmacy_management_system/screens/reports/Doctors_repots/doctorsreports.dart';
import 'package:fargard_pharmacy_management_system/screens/reports/purches_repots/PurcheseReports.dart';
import 'package:fargard_pharmacy_management_system/screens/reports/roznamche/roznamche.dart';
import 'package:fargard_pharmacy_management_system/screens/reports/selse_repots/SalesReports.dart';
import 'package:fargard_pharmacy_management_system/screens/reports/total_reports/totalreports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'employee_reports_page.dart';
class All_reports_page extends StatefulWidget {
  const All_reports_page({super.key});

  @override
  State<All_reports_page> createState() => _All_reports_pageState();
}

class _All_reports_pageState extends State<All_reports_page> {
  List<Map<String, dynamic>> pages(BuildContext context) => [
    {
      "name":AppLocalizations.of(context)!.journal,
      "icon": Icon(Icons.add_card_outlined),
      "navigate": Roznamche(),
    },
    {
      "name": AppLocalizations.of(context)!.purchase_reports,
      "icon": Icon(Icons.add_chart),
      "navigate": PurcheseReports(),
    },
    {
      "name": AppLocalizations.of(context)!.sales_reports,
      "icon": Icon(Icons.pending_actions),
      "navigate": SalesReports(),
    },
    {
      "name": AppLocalizations.of(context)!.employee_reports,
      "icon": Icon(Icons.add_reaction),
      // "navigate": TestPage(),
    },
    {
      "name": AppLocalizations.of(context)!.doctor_reports,
      "icon": Icon(Icons.bar_chart),
      "navigate": DoctorsReports(),
    },
    {
      "name": AppLocalizations.of(context)!.expense_reports,
      "icon": Icon(Icons.add_card_outlined),
      // "navigate": Medicine_register_page(),
    },
    {
      "name": AppLocalizations.of(context)!.total_income_expenses,
      "icon": Icon(Icons.add_card_outlined),
      "navigate": TotalReports(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    final pagesList = pages(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.reports),
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight:Radius.circular(30),topLeft: Radius.circular(30)),
                gradient: LinearGradient(colors:
                [
                  Colors.green,
                  Colors.greenAccent,
                ]),
            ),
            width: 600,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 40,left: 10,right: 10),
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

          ),
        ),
      )
    );
  }
}
