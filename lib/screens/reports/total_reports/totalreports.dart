import 'dart:ui';
import 'package:fargard_pharmacy_management_system/screens/reports/total_reports/sixmounth.dart';
import 'package:fargard_pharmacy_management_system/screens/reports/total_reports/threemounth.dart';
import 'package:fargard_pharmacy_management_system/screens/reports/total_reports/year.dart';
import 'package:fl_chart/fl_chart.dart';
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
            Text(AppLocalizations.of(context)!.total_income_expenses,
                style: TextStyle(fontSize: 30)),
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
                SizedBox(
                  width: 200,
                  child: Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("عواید",style: TextStyle(fontSize: 30),),
                          trailing: Icon(Icons.bookmark_outlined,color: Colors.blueAccent,size: 50,)
                        ),
                        ListTile(
                            title: Text("مصارف",style: TextStyle(fontSize: 30),),
                            trailing: Icon(Icons.bookmark_outlined,color: Colors.red,size: 50,)
                        ),
                        ListTile(
                            title: Text("خرید",style: TextStyle(fontSize: 30),),
                            trailing: Icon(Icons.bookmark_outlined,color: Colors.orange,size: 50,)
                        ),
                        ListTile(
                            title: Text("باقی",style: TextStyle(fontSize: 30),),
                            trailing: Icon(Icons.bookmark_outlined,color: Colors.lightGreenAccent,size: 50,)
                        ),
                      ],
                    ),
                  ),
                ),
                containerForReports(1500, 2000, 2000, "روزانه",3000),
                containerForReports(1500, 2000, 2000, "ماهانه",3000),
                containerForReports(1500, 2000, 2000, "سه ماه",3000),
                containerForReports(1500, 2000, 2000, "شش ماه",3000),
                containerForReports(1500, 2000, 2000, "سالانه",3000),
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

  Widget containerForReports(double incom, double expenses, double cash, String reportType,double purches) {
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
                color:
                    selectedReport == reportType ? Colors.white : Colors.white,
                width: selectedReport == reportType ? 3 : 1,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
            ),
            width: 220,
            height: 220,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              value: incom,
                              title: '$incom ؋ ',
                              color: Colors.red,
                              radius: 30,
                              titleStyle: TextStyle(
                                  fontSize: 16,
                                 ),
                            ),
                            PieChartSectionData(
                              value: expenses,
                              title: '$expenses ؋ ',
                              color: Colors.blueAccent,
                              radius: 30,
                              titleStyle: TextStyle(
                                  fontSize: 16,
                              ),
                            ),
                            PieChartSectionData(
                              value: cash,
                              title: "$cash ؋ ",
                              color: Colors.lightGreenAccent,
                              radius: 30,
                              titleStyle: TextStyle(
                                  fontSize: 16,
                              ),
                            ),
                            PieChartSectionData(
                              value: purches,
                              title: "$purches ؋ ",
                              color: Colors.orange,
                              radius: 30,
                              titleStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          )
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
        return Center(
            child: Text("گزارش انتخاب نشده", style: TextStyle(fontSize: 24)));
    }
  }
}
