import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Doctors_register_page extends StatefulWidget {
  const Doctors_register_page({super.key});

  @override
  State<Doctors_register_page> createState() => _Doctors_register_pageState();
}

class _Doctors_register_pageState extends State<Doctors_register_page> {
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
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
                    Center(child: Text(AppLocalizations.of(context)!.register_doctor)),
                    TextFormField(
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs1);
                      },
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.doctor_name,
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
                        labelText:AppLocalizations.of(context)!.surname ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    TextFormField(
                      focusNode: focs2,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs3);
                      },
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.contact_number,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    TextFormField(
                      focusNode: focs3,
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.education_level,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(onPressed:(){}, child:Text(AppLocalizations.of(context)!.save),style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellowAccent
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
