import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Prescription_page extends StatefulWidget {
  const Prescription_page({super.key});

  @override
  State<Prescription_page> createState() => _Prescription_pageState();
}

class _Prescription_pageState extends State<Prescription_page> {

  List<TextEditingController> medicine_name_controller = [];
  List<TextEditingController> quantity_controller = [];
  List<TextEditingController> fee_price_controller = [];
  List<TextEditingController> discount_controller = [];
  List<TextEditingController> total_price_controller = [];
  void addrow(){
    setState(() {
      TextEditingController orderlar1=TextEditingController();
      TextEditingController feelar1=TextEditingController();
      TextEditingController personlar1=TextEditingController();
      TextEditingController pricelar1=TextEditingController();
      medicine_name_controller.add(orderlar1);
      quantity_controller.add(feelar1);
      fee_price_controller.add(personlar1);
      discount_controller.add(pricelar1);
      total_price_controller.add(pricelar1);
    });
  }
  void deleterow(int i){
    setState(() {
      medicine_name_controller.removeAt(i);
      quantity_controller.removeAt(i);
      fee_price_controller.removeAt(i);
      discount_controller.removeAt(i);
      total_price_controller.removeAt(i);
    });
  }
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
  List<String> name=[
    "burger",
    "sandwich",
    "cole",
    "ghabole",
    "pizza",
    "hot dog",
    "kecheri",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed:addrow,child: Icon(Icons.add),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.blueAccent,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(
                      color: Colors.black,
                    )),
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
                            Text(AppLocalizations.of(context)!.patient_name),
                            Text(AppLocalizations.of(context)!.contact_number),
                            Text(AppLocalizations.of(context)!.related_doctor),
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
                                  width: 150,
                                  height: 30,
                                  child: TextFormField(
                                    style:
                                        TextStyle(fontSize: textfieldfontsize),
                                    textAlign: TextAlign.center,
                                    onFieldSubmitted: (value) {
                                      FocusScope.of(context)
                                          .requestFocus(focs2);
                                    },
                                    decoration: InputDecoration(
                                      hintText: "name",
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                    ),
                                  )),
                              SizedBox(
                                  width: 150,
                                  height: 30,
                                  child: TextFormField(
                                    focusNode: focs2,
                                    style:
                                        TextStyle(fontSize: textfieldfontsize),
                                    textAlign: TextAlign.center,
                                    onFieldSubmitted: (value) {
                                      FocusScope.of(context)
                                          .requestFocus(focs3);
                                    },
                                    decoration: InputDecoration(
                                        hintText: "phone",
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2))),
                                  )),
                              SizedBox(
                                  width: 150,
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
                                        hintText: "doctor",
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(2))),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(AppLocalizations.of(context)!
                                .prescription_number),
                            Text(AppLocalizations.of(context)!
                                .prescription_date),
                            Text(AppLocalizations.of(context)!.sale_date),
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
                                    style:
                                        TextStyle(fontSize: textfieldfontsize),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: "no",
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
                                    focusNode: focs1,
                                    style:
                                        TextStyle(fontSize: textfieldfontsize),
                                    textAlign: TextAlign.center,
                                    onFieldSubmitted: (value) {
                                      FocusScope.of(context)
                                          .requestFocus(focs2);
                                    },
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
                                    style:
                                        TextStyle(fontSize: textfieldfontsize),
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
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 450,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(80, 15, 80, 15),
                  child: Container(
                    color: Colors.grey.shade100,
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
                              5: FlexColumnWidth(1),
                            },
                            children: [
                              TableRow(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(1)),
                                  children: [
                                    Center(child: Text("#")),
                                    Center(
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .medicine_name)),
                                    Center(
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .quantity)),
                                    Center(
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .unit_price)),
                                    Center(
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .total_price)),
                                    Center(
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .discount)),
                                  ]),
                              for (int i = 0; i < medicine_name_controller.length; i++)
                              TableRow(children: [
                                SizedBox(
                                    height: 30,
                                    child: TextFormField(
                                      style: TextStyle(
                                          fontSize: textfieldfontsize),
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          hintText: "#",
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2))),
                                    )),
                                SizedBox(
                                    width: 120,
                                    height: 30,
                                    child:  DropdownButton2<String>(
                                      focusNode: focs4,
                                      items:name.map((name1){
                                        return DropdownMenuItem(
                                            value: name1,
                                            child:Text(name1));
                                      }).toList(),
                                      onChanged: null,
                                      hint: Text("Food"),
                                      dropdownSearchData: DropdownSearchData(
                                          searchInnerWidgetHeight:50,
                                          searchInnerWidget: Container(
                                            height: 60,
                                            padding: EdgeInsets.only(
                                              top: 8,
                                              bottom: 4,
                                              left: 8,
                                              right: 8,
                                            ),
                                            child: TextFormField(
                                              expands: true,
                                              maxLines: null,
                                              decoration: InputDecoration(
                                                  hintText: "Serach"
                                              ),
                                              onFieldSubmitted: (value) {
                                                FocusScope.of(context)
                                                    .requestFocus(focs6);
                                              },
                                            ),
                                          ),
                                      ),
                                    ),
                                ),
                                SizedBox(
                                    width: 120,
                                    height: 30,
                                    child: TextFormField(
                                      controller: quantity_controller[i],
                                      focusNode: focs5,
                                      style: TextStyle(
                                          fontSize: textfieldfontsize),
                                      textAlign: TextAlign.center,

                                      decoration: InputDecoration(hintText: AppLocalizations.of(context)!.quantity,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2))),
                                    )),
                                SizedBox(
                                    width: 120,
                                    height: 30,
                                    child: TextFormField(
                                      controller: fee_price_controller[i],
                                      focusNode: focs6,
                                      style: TextStyle(
                                          fontSize: textfieldfontsize),
                                      textAlign: TextAlign.center,
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(focs7);
                                      },
                                      decoration: InputDecoration(
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .unit_price,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2))),
                                    )),
                                SizedBox(
                                    width: 120,
                                    height: 30,
                                    child: TextFormField(
                                      controller: total_price_controller[i],
                                      focusNode: focs7,
                                      style: TextStyle(
                                          fontSize: textfieldfontsize),
                                      textAlign: TextAlign.center,
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(focs8);
                                      },
                                      decoration: InputDecoration(
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .total_price,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(2))),
                                    )),
                                SizedBox(
                                    width: 120,
                                    height: 30,
                                    child: TextFormField(
                                      controller: discount_controller[i],
                                      focusNode: focs8,
                                      style: TextStyle(
                                          fontSize: textfieldfontsize),
                                      textAlign: TextAlign.center,
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context)
                                            .requestFocus(focs9);
                                      },
                                      decoration: InputDecoration(
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .discount,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 8.0),
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
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.black)),
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
                        SizedBox(
                          width: 80,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child:
                                      Text(AppLocalizations.of(context)!.save),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.yellowAccent),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(AppLocalizations.of(context)!
                                      .save_and_print),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.yellowAccent),
                                ),
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
