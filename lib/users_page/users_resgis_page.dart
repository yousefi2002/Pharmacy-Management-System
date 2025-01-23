import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Users_register_page extends StatefulWidget {
  const Users_register_page({super.key});

  @override
  State<Users_register_page> createState() => _Users_register_pageState();
}

class _Users_register_pageState extends State<Users_register_page> {
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final List<String> name=["Admin","Pharmacist","Pharmacist Assistant"];
  String? selectvalue;
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
                    Center(child: Text(AppLocalizations.of(context)!.employees,style: TextStyle(fontSize: 35),)),
                    TextFormField(
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs1);
                      },
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.username,
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
                        labelText:AppLocalizations.of(context)!.gender ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    TextFormField(
                      focusNode: focs2,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs3);
                      },
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.password,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    SizedBox(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Icon(Icons.list,size: 16,color: Colors.lightGreenAccent,),
                            SizedBox(width: 4,),
                            Expanded(child: Text("Select Item",style:
                            TextStyle(fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightGreenAccent),
                              overflow: TextOverflow.ellipsis,))
                          ],
                        ),
                        items: name.map((String names)=>DropdownMenuItem<String>(
                          value: names,
                          child: Text(
                            names,style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreenAccent,
                          ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        ).toList(),
                        value: selectvalue,
                        onChanged:(String? value){
                          setState(() {
                            selectvalue=value;
                          });
                        },

                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(onPressed:(){}, child:Text(AppLocalizations.of(context)!.save,style: TextStyle(color: Colors.black),),style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreenAccent
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
