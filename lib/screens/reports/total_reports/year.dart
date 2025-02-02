import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class year extends StatefulWidget {
  const year({super.key});

  @override
  State<year> createState() => _yearState();
}

class _yearState extends State<year> {
  double radius = 25.0;
  int number = 1;

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
                    Text("از تاریخ"),
                    Text("تا تاریخ"),
                    Text("عاید"),
                    Text("مصارف"),
                    Text("باقی"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Card(
                    shadowColor: CupertinoColors.white,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    color: Colors.grey.shade300,
                    child: ListTile(
                      leading: Text("${index + 1}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                      trailing: Icon(Icons.eco, color: Colors.green,),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("1403/01/1"),
                          Text("1403/12/29"),
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