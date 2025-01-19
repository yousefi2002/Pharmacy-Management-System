import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Patients_regis_page extends StatefulWidget {
  const Patients_regis_page({super.key});

  @override
  State<Patients_regis_page> createState() => _Patients_regis_pageState();
}

class _Patients_regis_pageState extends State<Patients_regis_page> {
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final FocusNode focs5 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: Container(
              width: 600,
              height:600,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 40, 100, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(child: Text(AppLocalizations.of(context)!.register_patient)),
                    TextFormField(
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs1);
                      },
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.patient_name,
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
                        }, child:Text(AppLocalizations.of(context)!.save),style:ElevatedButton.styleFrom(
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
