import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
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
                        const SizedBox(width: 20,),
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
                        ElevatedButton(onPressed:(){},style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellowAccent
                        ), child:Text(AppLocalizations.of(context)!.save),),
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
