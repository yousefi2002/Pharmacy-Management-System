import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/patients.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/crud_for_patients.dart';
class AddPatientPage extends StatefulWidget {
  final Patient patient;
  const AddPatientPage(this.patient, {super.key});

  @override
  _AddPatientPageState createState() => _AddPatientPageState(this.patient);
}

class _AddPatientPageState extends State<AddPatientPage> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  Patient patient;
  _AddPatientPageState(this.patient,);

  @override
  void initState() {
    super.initState();
    _nameController.text = patient.name ?? '';
    _addressController.text = patient.address ?? '';
    _contactController.text = patient.contactNumber ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.newPatient, style: TextStyle(fontSize: 25),)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
          child: Container(
            height: 600,
            width: 800,
            decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.activeGreen),
                color: Colors.white
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     Center(child: Text(AppLocalizations.of(context)!.newPatient, style: TextStyle(fontSize: 25),)),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the Patient\'s name';
                        }
                        return null;
                      },
                      controller: _nameController,
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
                          return 'Please enter the Patient\'s Address';
                        }
                        return null;
                      },
                      controller: _addressController,
                      focusNode: focs1,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs2);
                      },
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.address,
                        labelStyle: const TextStyle(
                          color: Colors.green, // Label text color
                          fontSize: 16,
                        ),
                        hintText: 'Address like 7th Area',
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
                          return 'Please enter the Patient\'s Phone number';
                        }
                        return null;
                      },
                      controller: _contactController,
                      focusNode: focs3,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.contact_number,
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
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {

                          if (patient.id != null) {
                            final updatedPatient = Patient(
                              patient.id,
                              _nameController.text,
                              _addressController.text,
                              _contactController.text,
                            );
                            await Provider.of<PatientProvider>(context, listen: false)
                                .updatePatient(updatedPatient);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Patient updated successfully!')),
                            );
                          } else {
                            final addPatient = Patient(
                              patient.id,
                              _nameController.text,
                              _addressController.text,
                              _contactController.text,
                            );
                            await Provider.of<PatientProvider>(context, listen: false)
                                .addPatient(addPatient);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Patient added successfully!')),
                            );
                          }

                          _formKey.currentState!.reset();
                          _nameController.clear();
                          _addressController.clear();
                          _contactController.clear();

                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
                      child: Text(AppLocalizations.of(context)!.save, style: TextStyle(color: Colors.white)),
                     )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
