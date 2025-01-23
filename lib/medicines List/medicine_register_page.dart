import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../modal_classes/medicines.dart';
import 'crud_for_medicines.dart';

class MedicineRegisterPage extends StatefulWidget {
  final Medicine medicine;
  const MedicineRegisterPage(this.medicine, {super.key});

  @override
  State<MedicineRegisterPage> createState() =>
      _MedicineRegisterPageState(this.medicine);
}

class _MedicineRegisterPageState extends State<MedicineRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _genericIdController = TextEditingController();
  final TextEditingController _companyIdController = TextEditingController();

  Medicine medicine;
  _MedicineRegisterPageState(this.medicine);

  @override
  void initState() {
    super.initState();
    _nameController.text = medicine.name;
    _descriptionController.text = medicine.description;
    _typeController.text = medicine.type;
    _priceController.text = medicine.pricePerUnit.toString();
    _genericIdController.text = medicine.genericId;
    _companyIdController.text = medicine.companyId;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _typeController.dispose();
    _priceController.dispose();
    _genericIdController.dispose();
    _companyIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.white)),
              width: 600,
              height: 600,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 40, 100, 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                          child: Text(
                        AppLocalizations.of(context)!.register_medicine,
                        style: TextStyle(fontSize: 35),
                      )),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(context)!.generic_name,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the patient\'s name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.trade_name,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the patient\'s name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _typeController,
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.barcode,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the patient\'s name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _priceController,
                        decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(context)!.batch_number,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the patient\'s name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _genericIdController,
                        decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(context)!.description,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the patient\'s name';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _companyIdController,
                        decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(context)!.manufacturer,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the patient\'s name';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {

                            if (medicine.id != null) {
                              final updatedMedicine = Medicine(
                                 medicine.id,
                                _nameController.text,
                                _descriptionController.text,
                                _typeController.text,
                                double.tryParse(_priceController.text) ?? 0.0,
                                _genericIdController.text,
                                _companyIdController.text,
                              );
                              await Provider.of<MedicinesProvider>(context, listen: false)
                                  .updateMedicine(updatedMedicine);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Medicine updated successfully!')),
                              );
                            } else {
                              final newMedicine = Medicine(
                                medicine.id,
                                _nameController.text,
                                _descriptionController.text,
                                _typeController.text,
                                double.tryParse(_priceController.text) ?? 0.0,
                                _genericIdController.text,
                                _companyIdController.text,
                              );
                              await Provider.of<MedicinesProvider>(context, listen: false)
                                  .addMedicine(newMedicine);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Medicine added successfully!')),
                              );
                            }

                            _formKey.currentState!.reset();
                            // _descriptionController.clear();
                            // _nameController.clear();
                            // _typeController.clear();
                            // _priceController.clear();
                            // _genericIdController.clear();
                            // _companyIdController.clear();
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreenAccent),
                        child: Text(
                          AppLocalizations.of(context)!.save,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
