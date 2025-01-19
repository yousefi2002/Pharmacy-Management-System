import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Expenses_page extends StatefulWidget {
  const Expenses_page({super.key});

  @override
  State<Expenses_page> createState() => _Expenses_pageState();
}

class _Expenses_pageState extends State<Expenses_page> {
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
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
                    Center(child: Text(AppLocalizations.of(context)!.record_expenses)),
                    TextFormField(
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs1);
                      },
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.description,
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
                          labelText:AppLocalizations.of(context)!.amount ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    TextFormField(
                      focusNode: focs2,

                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.by,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.date,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.time,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                            ),
                          ),
                        ),
                      ],
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
