import 'package:fargard_pharmacy_management_system/doctors_page/crud_for_doctor.dart';
import 'package:fargard_pharmacy_management_system/modal_classes/doctors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class DoctorPage extends StatefulWidget {
  final Doctor doctor;
  const DoctorPage(this.doctor,{super.key,});

  @override
  State<DoctorPage> createState() => _DoctorPageState(this.doctor);
}

class _DoctorPageState extends State<DoctorPage> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  TextEditingController nameController=TextEditingController();
  TextEditingController specialization=TextEditingController();
  TextEditingController contactNumber=TextEditingController();

  Doctor doctor;
  _DoctorPageState(this.doctor);
  @override
  void initState() {
    super.initState();
    nameController.text=doctor.name;
    specialization.text=doctor.role;
    contactNumber.text=doctor.contactNumber;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    specialization.dispose();
    contactNumber.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.newDoctor, style: const TextStyle(fontSize: 30),),),
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
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: Text(AppLocalizations.of(context)!.newDoctor,style: TextStyle(fontSize: 35),)),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Doctor\'s name';
                          }
                          return null;
                        },
                        controller: nameController,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs1);
                        },
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.doctor_name,
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
                            return 'Please enter the Doctor\'s Phone number';
                          }
                          return null;
                        },
                        controller: contactNumber,
                        focusNode: focs1,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs2);
                        },
                        decoration: InputDecoration(
                          labelText:AppLocalizations.of(context)!.contact_number,
                          labelStyle: const TextStyle(
                            color: Colors.green, // Label text color
                            fontSize: 16,
                          ),
                          hintText: 'Contact like 0799887766',
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
                            return 'Please enter the Doctor\'s specialization';
                          }
                          return null;
                        },
                        controller: specialization,
                        focusNode: focs2,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs3);
                        },
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.specialty,
                          labelStyle: const TextStyle(
                            color: Colors.green, // Label text color
                            fontSize: 16,
                          ),
                          hintText: 'specialization like MD ',
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
                          ElevatedButton(
                            onPressed:()async{
                            String createdAt = DateTime.now().toString();
                            String updatedAt = DateTime.now().toString();
                            if(_formKey.currentState!.validate()){
                              if(doctor.id!=null){
                                final updatedoctor=Doctor(
                                    nameController.text,
                                    specialization.text,
                                    contactNumber.text,
                                    createdAt,
                                    updatedAt,
                                  id: doctor.id,
                                );
                                await Provider.of<DoctorProvider>(context,listen: false).updateDoctor(updatedoctor);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Doctor updated successfully!')),
                                );
                              }else{
                                final addDoctor=Doctor(nameController.text, specialization.text, contactNumber.text, createdAt, updatedAt);
                                print(addDoctor);
                                await Provider.of<DoctorProvider>(context,listen: false).addDoctor(addDoctor);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Doctor added successfully!')),
                                );
                              }
                              _formKey.currentState!.reset();
                              nameController.clear();
                              contactNumber.clear();
                              specialization.clear();
                              Navigator.pop(context);
                            }
                          },style:ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen
                          ), child:Text(AppLocalizations.of(context)!.save, style: TextStyle(color: Colors.white))),
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
