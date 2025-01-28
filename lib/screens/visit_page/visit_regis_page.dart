import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
class VisitPage extends StatefulWidget {
  const VisitPage({super.key});

  @override
  State<VisitPage> createState() => _VisitPageState();
}

class _VisitPageState extends State<VisitPage> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final FocusNode focs5 = FocusNode();
  final List<String> name=["Dr.Rahmani","Dr.Habebi","Dr.Rahmati"];
  String? selectvalue;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController doctornameController = TextEditingController();
  final TextEditingController patientnameController = TextEditingController();
  final TextEditingController patientageController = TextEditingController();
  final TextEditingController patientgenderController = TextEditingController();
  final TextEditingController patientcontectController = TextEditingController();
  final TextEditingController feescontroller = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController usercontroller = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime now = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }
  Future<void> _selectTime() async {
    TimeOfDay now = TimeOfDay.now();
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: now,
    );

    if (pickedTime != null) {
      setState(() {
        _timeController.text =
        '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}:00';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.newVisit, style: const TextStyle(fontSize: 30),),),
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.activeGreen),
                  color: Colors.white
              ),
              width: 800,
              height:600,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 40, 100, 10),
                child: Form(
                  key:_formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: Text(AppLocalizations.of(context)!.newVisit,style: TextStyle(fontSize: 35),)),
                      SizedBox(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Icon(Icons.list,size: 16,color: Colors.lightGreenAccent,),
                              SizedBox(width: 4,),
                              Expanded(child: Text("Select Doctor",style:
                              TextStyle(fontSize: 22,
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
                              color: Colors.lightGreen,
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
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Patient\'s name';
                          }
                          return null;
                        },
                        controller:patientnameController ,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs1);
                        },
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.patient_name,
                          labelStyle: const TextStyle(
                            color: Colors.green, // Label text color
                            fontSize: 16,
                          ),
                          hintText: 'Full Name like Ahmad Ahmadi',
                          hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5), // Rounded border
                            borderSide: const BorderSide(
                              color: Colors.greenAccent, // Border color when not focused
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5), // Rounded border
                            borderSide: const BorderSide(
                              color: Colors.green, // Border color when focused
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.red, // Border color on error
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.redAccent, // Border color on focused error
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ), // Inner padding
                          filled: true,
                          fillColor: Colors.green.shade50, // Background color
                        ),
                        style: const TextStyle(
                          color: Colors.black, // Input text color
                          fontSize: 18,
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Patient\'s Age';
                          }
                          return null;
                        },
                        focusNode: focs1,
                        controller:patientageController ,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs2);
                        },
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.age,
                          labelStyle: const TextStyle(
                            color: Colors.green, // Label text color
                            fontSize: 16,
                          ),
                          hintText: 'Age like 20 or 25',
                          hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5), // Rounded border
                            borderSide: const BorderSide(
                              color: Colors.greenAccent, // Border color when not focused
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5), // Rounded border
                            borderSide: const BorderSide(
                              color: Colors.green, // Border color when focused
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.red, // Border color on error
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.redAccent, // Border color on focused error
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ), // Inner padding
                          filled: true,
                          fillColor: Colors.green.shade50, // Background color
                        ),
                        style: const TextStyle(
                          color: Colors.black, // Input text color
                          fontSize: 18,
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Doctor\'s Gender';
                          }
                          return null;
                        },
                        focusNode: focs2,
                        controller:patientgenderController ,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs3);
                        },
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.gender,
                          labelStyle: const TextStyle(
                            color: Colors.green, // Label text color
                            fontSize: 16,
                          ),
                          hintText: 'Full Name like Ahmad Ahmadi',
                          hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5), // Rounded border
                            borderSide: const BorderSide(
                              color: Colors.greenAccent, // Border color when not focused
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5), // Rounded border
                            borderSide: const BorderSide(
                              color: Colors.green, // Border color when focused
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.red, // Border color on error
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.redAccent, // Border color on focused error
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ), // Inner padding
                          filled: true,
                          fillColor: Colors.green.shade50, // Background color
                        ),
                        style: const TextStyle(
                          color: Colors.black, // Input text color
                          fontSize: 18,
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Patient\'s name';
                          }
                          return null;
                        },
                        focusNode:focs3,
                        controller:patientcontectController ,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.contact_number,
                          labelStyle: const TextStyle(
                            color: Colors.green, // Label text color
                            fontSize: 16,
                          ),
                          hintText: 'Phone Number 079839284939',
                          hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5), // Rounded border
                            borderSide: const BorderSide(
                              color: Colors.greenAccent, // Border color when not focused
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5), // Rounded border
                            borderSide: const BorderSide(
                              color: Colors.green, // Border color when focused
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.red, // Border color on error
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.redAccent, // Border color on focused error
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ), // Inner padding
                          filled: true,
                          fillColor: Colors.green.shade50, // Background color
                        ),
                        style: const TextStyle(
                          color: Colors.black, // Input text color
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child:      TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the Time';
                                }
                                return null;
                              },
                              controller: _timeController,
                              onTap: _selectTime,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.time,
                                labelStyle: const TextStyle(
                                  color: Colors.green, // Label text color
                                  fontSize: 16,
                                ),
                                hintText: '',
                                hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5), // Rounded border
                                  borderSide: const BorderSide(
                                    color: Colors.greenAccent, // Border color when not focused
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5), // Rounded border
                                  borderSide: const BorderSide(
                                    color: Colors.green, // Border color when focused
                                    width: 2,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Colors.red, // Border color on error
                                    width: 2,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Colors.redAccent, // Border color on focused error
                                    width: 2,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 12.0,
                                ), // Inner padding
                                filled: true,
                                fillColor: Colors.green.shade50, // Background color
                              ),
                              style: const TextStyle(
                                color: Colors.black, // Input text color
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          Expanded(
                            child:      TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the Date';
                                }
                                return null;
                              },
                              controller: _dateController,
                              readOnly: true,
                              onTap: _selectDate,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.date,
                                labelStyle: const TextStyle(
                                  color: Colors.green, // Label text color
                                  fontSize: 16,
                                ),
                                hintText: '',
                                hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5), // Rounded border
                                  borderSide: const BorderSide(
                                    color: Colors.greenAccent, // Border color when not focused
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5), // Rounded border
                                  borderSide: const BorderSide(
                                    color: Colors.green, // Border color when focused
                                    width: 2,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: Colors.red, // Border color on error
                                    width: 2,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Colors.redAccent, // Border color on focused error
                                    width: 2,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 12.0,
                                ), // Inner padding
                                filled: true,
                                fillColor: Colors.green.shade50, // Background color
                              ),
                              style: const TextStyle(
                                color: Colors.black, // Input text color
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
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
        ),
      ) ,
    );
  }
}
