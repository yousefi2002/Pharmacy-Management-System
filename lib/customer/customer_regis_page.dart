import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Customer_regis_page extends StatefulWidget {
  const Customer_regis_page({super.key});

  @override
  State<Customer_regis_page> createState() => _Customer_regis_pageState();
}
class _Customer_regis_pageState extends State<Customer_regis_page> {
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final FocusNode focs5 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.white)
              ),
              width: 600,
              height:600,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 40, 100, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(child: Text(AppLocalizations.of(context)!.register_customer,style: TextStyle(fontSize: 35),)),
                    TextFormField(
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs1);
                      },
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.customer_name,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    TextFormField(
                      focusNode: focs1,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs2);
                      },
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.age,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    TextFormField(
                      focusNode: focs2,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs3);
                      },
                      decoration: InputDecoration(
                          labelText:AppLocalizations.of(context)!.gender,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    TextFormField(
                      focusNode: focs3,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs4);
                      },
                      decoration: InputDecoration(
                          labelText:AppLocalizations.of(context)!.contact_number ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    TextFormField(
                      focusNode: focs4,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs5);
                      },
                      decoration: InputDecoration(
                          labelText:AppLocalizations.of(context)!.address ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(onPressed:(){
                          Navigator.pop(context);
                        }, child:Text(AppLocalizations.of(context)!.save,style: TextStyle(color: Colors.black),),style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
