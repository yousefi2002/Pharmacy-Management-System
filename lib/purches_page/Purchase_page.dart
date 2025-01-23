import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class PurchasePage extends StatefulWidget {
  const PurchasePage({super.key});

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final FocusNode focs5 = FocusNode();
  final FocusNode focs6 = FocusNode();
  final FocusNode focs7 = FocusNode();
  final FocusNode focs8 = FocusNode();
  final FocusNode focs9 = FocusNode();
  double textfieldfontsize = 13.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.black)
                ),
                width: double.infinity,
                height: 130,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)!.invoice_number),
                            Text(AppLocalizations.of(context)!.account),

                          ],
                        ),
                        SizedBox(width: 20,),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                  width: 150,
                                  height: 30,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: textfieldfontsize),
                                    textAlign: TextAlign.center,
                                    onFieldSubmitted: (value) {
                                      FocusScope.of(context).requestFocus(focs2);
                                    },
                                    decoration: InputDecoration(
                                      hintText: "شماره فاکتور",
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 8.0),
                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
                                    ),
                                  )),
                              SizedBox(
                                  width: 150,
                                  height: 30,
                                  child: TextFormField(
                                    focusNode: focs2,
                                    style: TextStyle(fontSize: textfieldfontsize),
                                    textAlign: TextAlign.center,
                                    onFieldSubmitted: (value) {
                                      FocusScope.of(context).requestFocus(focs3);
                                    },
                                    decoration: InputDecoration(
                                        hintText: "طرف حساب",
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(2))),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(width: 50,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(AppLocalizations.of(context)!.prescription_date),
                            Text(AppLocalizations.of(context)!.registration_date),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                  width: 120,
                                  height: 30,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: textfieldfontsize),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: "s date",
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(2))),
                                  )),
                              SizedBox(
                                  width: 120,
                                  height: 30,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: textfieldfontsize),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: "e date",
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(2))),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.grey.shade100,
                ),
                width: double.infinity,
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                  child: Container(
                    color: Colors.blue.shade100,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Table(
                            columnWidths: {
                              0: FlexColumnWidth(0.5),
                              1: FlexColumnWidth(2),
                              2: FlexColumnWidth(1),
                              3: FlexColumnWidth(1),
                              4: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(1)),
                                  children: [
                                    Center(child: Text("#")),
                                    Center(child: Text(AppLocalizations.of(context)!.medicine_name)),
                                    Center(child: Text(AppLocalizations.of(context)!.quantity)),
                                    Center(child: Text(AppLocalizations.of(context)!.unit_price)),
                                    Center(child: Text(AppLocalizations.of(context)!.total_price)),
                                  ]),
                              TableRow(children: [
                                SizedBox(

                                    height: 30,
                                    child: TextFormField(
                                      style:
                                      TextStyle(fontSize: textfieldfontsize),
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          hintText: "#",
                                          contentPadding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(2))),
                                    )),
                                SizedBox(
                                    width: 120,
                                    height: 30,
                                    child: TextFormField(
                                      focusNode: focs3,
                                      style:
                                          TextStyle(fontSize: textfieldfontsize),
                                      textAlign: TextAlign.center,
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(focs4);
                                      },
                                      decoration: InputDecoration(
                                          hintText:AppLocalizations.of(context)!.medicine_name,
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 8.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2))),
                                    )),
                                SizedBox(
                                    width: 120,
                                    height: 30,
                                    child: TextFormField(
                                      focusNode: focs4,
                                      style:
                                          TextStyle(fontSize: textfieldfontsize),
                                      textAlign: TextAlign.center,
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(focs5);
                                      },
                                      decoration: InputDecoration(
                                          hintText: AppLocalizations.of(context)!.quantity,
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 8.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2))),
                                    )),
                                SizedBox(
                                    width: 120,
                                    height: 30,
                                    child: TextFormField(
                                      focusNode: focs5,
                                      style:
                                          TextStyle(fontSize: textfieldfontsize),
                                      textAlign: TextAlign.center,
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(focs6);
                                      },
                                      decoration: InputDecoration(
                                          hintText: AppLocalizations.of(context)!.unit_price,
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 8.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2))),
                                    )),
                                SizedBox(
                                    width: 120,
                                    height: 30,
                                    child: TextFormField(
                                      focusNode: focs6,
                                      style:
                                          TextStyle(fontSize: textfieldfontsize),
                                      textAlign: TextAlign.center,
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(focs7);
                                      },
                                      decoration: InputDecoration(
                                          hintText:AppLocalizations.of(context)!.total_price,
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 8.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2))),
                                    )),
                              ])
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(color: Colors.black)
                ),
                width: double.infinity,
                height: 130,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)!.total_price),
                            Text(AppLocalizations.of(context)!.discount),
                            Text(AppLocalizations.of(context)!.amount_payable),
                          ],
                        ),
                        SizedBox(width: 80,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Row(
                             children: [
                               ElevatedButton(
                                 onPressed:(){
                                   Navigator.of(context).pop();
                                 }, child:Text(AppLocalizations.of(context)!.save),style:ElevatedButton.styleFrom(
                                 backgroundColor: Colors.yellowAccent
                               ),),
                             ],
                           ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
