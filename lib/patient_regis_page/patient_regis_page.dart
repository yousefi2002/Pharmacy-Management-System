import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modal_classes/patients.dart';
import 'crud_for_patients.dart';

class AddPatientPage extends StatefulWidget {
  final Patient patient;
  const AddPatientPage(this.patient, {super.key});

  @override
  _AddPatientPageState createState() => _AddPatientPageState(this.patient);
}

class _AddPatientPageState extends State<AddPatientPage> {
  final _formKey = GlobalKey<FormState>();

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
        title: const Text('Edit Patient'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
          child: Container(
            height: 600,
            width: 600,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: CupertinoColors.white, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(100, 40, 100, 10),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Center(child: Text('Patient', style: TextStyle(fontSize: 25),)),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          labelText: 'name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.white)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the patient\'s name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                          labelText: 'address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the patient\'s address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _contactController,
                      decoration: InputDecoration(
                          labelText: 'contact',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the patient\'s contact number';
                        }
                        return null;
                      },
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
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreenAccent),
                      child: Text('save', style: TextStyle(color: Colors.black),),
                     ),
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
