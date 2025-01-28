import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class Roznamcha extends StatefulWidget {
  const Roznamcha({super.key});

  @override
  State<Roznamcha> createState() => _RoznamchaState();
}

class _RoznamchaState extends State<Roznamcha> {
  double radius = 25.0;
  int number=1;
  var count=0;
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController=TextEditingController();
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Row(
          children: [
            Text("Roznamcha", style: TextStyle(fontSize: 30),),
            const Expanded(child: SizedBox()),
            Expanded(
              child: SearchBarAnimation(
                  textEditingController: textEditingController,
                  isOriginalAnimation: true,
                  enableKeyboardFocus: true,
                  trailingWidget: Icon(Icons.search,color: Colors.black,),
                  secondaryButtonWidget:Icon(Icons.close,color: Colors.black,),
                  buttonWidget:Icon(Icons.search,color: Colors.black,)
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
                container_for_reports(20000, 12000, 8000, "روزانه"),
                container_for_reports(20000, 12000, 8000, "ماهانه"),
                container_for_reports(20000, 12000, 8000, "سه ماه"),
                container_for_reports(20000, 12000, 8000, "شش ماه"),
                container_for_reports(20000, 12000, 8000, "سالانه"),
              ],
            ),
          ),
          Card(
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: CupertinoColors.white)
            ),
              color: Colors.green.shade300,
              child: ListTile(
                trailing: Icon(Icons.eco_outlined),
                leading: Padding(
                  padding:EdgeInsets.all(8.0),
                  child: Text("#",style: TextStyle(fontSize: 20),),
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
              )),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Card(
                    shadowColor:CupertinoColors.white,
                    shape:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    color: Colors.grey.shade300,
                    child: ListTile(
                      trailing: Icon(Icons.eco,color: Colors.green,),
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${count++}",style: TextStyle(fontSize: 20),),
                      ),
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
          ),
        ],
      ),
    );
  }

  Widget container_for_reports(int incom, int expenses, int cash, String date,) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(date),
        ),
        Container(
          decoration: BoxDecoration(
            gradient:LinearGradient(colors: [Colors.green.shade300,Colors.greenAccent]),
              border: Border.all(
                  style: BorderStyle.solid, color: Colors.white),
              color: Colors.green.shade300,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius))),
          width: 150,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${AppLocalizations.of(context)!.amount}: ${incom}",
                  style: TextStyle(fontSize: 20, fontFamily: "Nazanin"),
                ),
                Text("${AppLocalizations.of(context)!.expenses}: ${expenses}",
                    style: TextStyle(fontSize: 20, fontFamily: "Nazanin")),
                Text("${AppLocalizations.of(context)!.inventory}: ${cash}",
                    style: TextStyle(fontSize: 20, fontFamily: "Nazanin")),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
