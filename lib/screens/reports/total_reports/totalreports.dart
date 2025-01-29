import 'dart:ui';
import 'package:fargard_pharmacy_management_system/screens/reports/total_reports/sixmounth.dart';
import 'package:fargard_pharmacy_management_system/screens/reports/total_reports/threemounth.dart';
import 'package:fargard_pharmacy_management_system/screens/reports/total_reports/year.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import 'daily.dart';
import 'mounthly.dart';

class TotalReports extends StatefulWidget {
  const TotalReports({super.key});

  @override
  State<TotalReports> createState() => _TotalReportsState();
}

class _TotalReportsState extends State<TotalReports> {
  double radius = 25.0;
  String selectedReport = "ماهانه"; // نوع گزارش انتخاب شده

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Row(
          children: [
            Text(AppLocalizations.of(context)!.total_income_expenses, style: TextStyle(fontSize: 30)),
            const Expanded(child: SizedBox()),
            Expanded(
              child: SearchBarAnimation(
                textEditingController: textEditingController,
                isOriginalAnimation: true,
                enableKeyboardFocus: true,
                trailingWidget: Icon(Icons.search, color: Colors.black),
                secondaryButtonWidget: Icon(Icons.close, color: Colors.black),
                buttonWidget: Icon(Icons.search, color: Colors.black),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                containerForReports(20000, 12000, 8000, "روزانه"),
                containerForReports(20000, 12000, 8000, "ماهانه"),
                containerForReports(20000, 12000, 8000, "سه ماه"),
                containerForReports(20000, 12000, 8000, "شش ماه"),
                containerForReports(20000, 12000, 8000, "سالانه"),
              ],
            ),
          ),

          Expanded(
            child: getReportWidget(selectedReport),
          ),
        ],
      ),
    );
  }

  Widget containerForReports(int incom, int expenses, int cash, String reportType) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedReport = reportType; // تنظیم نوع گزارش انتخاب‌شده
        });
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              reportType,
              style: TextStyle(
                fontWeight: selectedReport == reportType
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: selectedReport == reportType
                    ? [Colors.green.shade600, Colors.greenAccent]
                    : [Colors.green.shade300, Colors.greenAccent],
              ),
              border: Border.all(
                style: BorderStyle.solid,
                color: selectedReport == reportType
                    ? Colors.white
                    : Colors.white,
                width: selectedReport == reportType ? 3 : 1,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
            ),
            width: 180,
            height: 180,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${AppLocalizations.of(context)!.amount}: $incom",
                    style: TextStyle(fontSize: 20, fontFamily: "Nazanin"),
                  ),
                  Text(
                    "${AppLocalizations.of(context)!.expenses}: $expenses",
                    style: TextStyle(fontSize: 20, fontFamily: "Nazanin"),
                  ),
                  Text(
                    "${AppLocalizations.of(context)!.inventory}: $cash",
                    style: TextStyle(fontSize: 20, fontFamily: "Nazanin"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  // ویجت گزارش بر اساس نوع انتخاب‌شده
  Widget getReportWidget(String reportType) {
    switch (reportType) {
      case "روزانه":
        return Daily_reports();
      case "ماهانه":
        return Mouthly(); // ویجت گزارش ماهانه
      case "سه ماه":
        return threemounths();
      case "شش ماه":
        return sixmounths();
      case "سالانه":
        return year();
      default:
        return Center(child: Text("گزارش انتخاب نشده", style: TextStyle(fontSize: 24)));
    }
  }
}
