import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Daily_reports extends StatefulWidget {
  const Daily_reports({super.key});

  @override
  State<Daily_reports> createState() => _Daily_reportsState();
}

class _Daily_reportsState extends State<Daily_reports> {
  double radius = 25.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Container(
        child: Column(
          children: [
            Card(
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: CupertinoColors.white),
              ),
              color: Colors.green.shade300,
              child: ListTile(
                trailing: Icon(Icons.eco_outlined),
                leading: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "#",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("         تاریخ"),
                    Text("روز"),
                    Text("عاید"),
                    Text("مصارف"),
                    Text("باقی"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Card(
                    shadowColor: CupertinoColors.white,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    color: Colors.grey.shade300,
                    child: ListTile(
                      trailing: Icon(Icons.eco, color: Colors.green,),
                      leading: Text("${index + 1}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("1403/12/4"),
                          Text("شنبه"),
                          Text("15000"),
                          Text("4000"),
                          Text("11000"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}