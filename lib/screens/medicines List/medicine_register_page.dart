import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fargard_pharmacy_management_system/models/generic_names.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_company_name.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_generic_name.dart';
import 'package:fargard_pharmacy_management_system/utilities/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../models/companies.dart';
import '../../models/medicines.dart';
import '../../providers/crud_for_medicines.dart';
import '../purches_page/Purchase_page.dart';

class MedicineRegisterPage extends StatefulWidget {
  final Medicine medicine;
  const MedicineRegisterPage(this.medicine, {super.key});

  @override
  State<MedicineRegisterPage> createState() =>
      _MedicineRegisterPageState(this.medicine);
}

class _MedicineRegisterPageState extends State<MedicineRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final FocusNode focs5 = FocusNode();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _buyPriceController = TextEditingController();
  final TextEditingController _genericNameController = TextEditingController();
  final TextEditingController _barCodeController = TextEditingController();
  final TextEditingController _sellPriceController = TextEditingController();

  final List<String> medicineTypes = [
    'Tablet',
    'Liquid',
    'Capsule',
    'Injection',
    'Syrup',
    'Other'
  ];
  String? selectedMedicineType;
  Medicine medicine;
  _MedicineRegisterPageState(this.medicine);

  @override
  void initState() {
    super.initState();
    _nameController.text = medicine.name;
    _descriptionController.text = medicine.description;
    _typeController.text = medicine.type;
    // _buyPriceController.text = medicine.buyPrice.toString();
    _genericNameController.text = medicine.genericName;
    _barCodeController.text = medicine.barCode;
    // _sellPriceController.text = medicine.sellPrice.toString();
    _buyPriceController.text = medicine.buyPrice != 0.0 ? medicine.buyPrice.toString() : '';
    _sellPriceController.text = medicine.sellPrice != 0.0 ? medicine.sellPrice.toString() : '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _typeController.dispose();
    _buyPriceController.dispose();
    _genericNameController.dispose();
    _barCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.add_medicine,
          style: const TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 800,
              minHeight: 600,
            ),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.activeGreen)),
              width: 800,
              height: 600,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                          child: Text(
                        AppLocalizations.of(context)!.add_medicine,
                        style: const TextStyle(fontSize: 35),
                      )),
                      //Generic name
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the generic name';
                          }
                          return null;
                        },
                        controller: _genericNameController,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs3);
                        },
                        decoration: MyInputDecoration1(
                            labelText:
                                AppLocalizations.of(context)!.generic_name,
                            hintText: 'Name like for Headache'),
                        style: const TextStyle(
                          color: Colors.black, // Input text color
                          fontSize: 18,
                        ),
                      ),
                      //Medicine name
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the medicine name';
                          }
                          return null;
                        },
                        controller: _nameController,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs1);
                        },
                        decoration: MyInputDecoration1(
                            labelText:
                                AppLocalizations.of(context)!.medicine_name,
                            hintText: 'Name like Panadol'),
                        style: const TextStyle(
                          color: Colors.black, // Input text color
                          fontSize: 18,
                        ),
                      ),
                      //Buy Price
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the buy price';
                          }
                          return null;
                        },
                        controller: _buyPriceController,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs4);
                        },
                        decoration: MyInputDecoration1(
                            labelText: AppLocalizations.of(context)!.buyPrice,
                            hintText: 'Name like 3.1'),
                        style: const TextStyle(
                          color: Colors.black, // Input text color
                          fontSize: 18,
                        ),
                      ),
                      //Sell Price
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the sell price';
                          }
                          return null;
                        },
                        controller: _sellPriceController,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs4);
                        },
                        decoration: MyInputDecoration1(
                            labelText:
                                AppLocalizations.of(context)!.sellPrice,
                            hintText: 'Name like 3.1'),
                        style: const TextStyle(
                          color: Colors.black, // Input text color
                          fontSize: 18,
                        ),
                      ),
                      //Bar Code
                      TextFormField(
                        controller: _barCodeController,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs2);
                        },
                        decoration: MyInputDecoration1(
                            labelText: AppLocalizations.of(context)!.barcode,
                            hintText: 'Name like 09874379874304987598743'),
                        style: const TextStyle(
                          color: Colors.black, // Input text color
                          fontSize: 18,
                        ),
                      ),
                      //Description
                      TextFormField(
                        controller: _descriptionController,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs2);
                        },
                        minLines: 3, // Minimum 3 lines
                        maxLines: null, // Allows it to expand as needed
                        keyboardType: TextInputType.multiline,
                        decoration: MyInputDecoration1(
                            labelText:
                                AppLocalizations.of(context)!.description,
                            hintText: 'Name like This is for...'),
                        style: const TextStyle(
                          color: Colors.black, // Input text color
                          fontSize: 18,
                        ),
                      ),
                      //Type
                      DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select the medicine\'s type' ;
                          }
                          return null;
                        },
                        decoration: MyInputDecoration1(
                            labelText: AppLocalizations.of(context)!.type,
                            hintText: 'Name like Tablet'),
                        value: selectedMedicineType,
                        items: medicineTypes.map((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedMedicineType = newValue;
                          });
                        },
                      ),

                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (medicine.id != null) {
                              final updatedMedicine = Medicine(
                                  medicine.id,
                                  _genericNameController.text,
                                  _nameController.text,
                                  double.tryParse(_buyPriceController.text),
                                  double.tryParse(_sellPriceController.text),
                                  _barCodeController.text,
                                  _descriptionController.text,
                                  selectedMedicineType);
                              await Provider.of<MedicinesProvider>(context,
                                      listen: false)
                                  .updateMedicine(updatedMedicine);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Medicine updated successfully!')),
                              );
                            } else {
                              final newMedicine = Medicine(
                                  medicine.id,
                                  _genericNameController.text,
                                  _nameController.text,
                                  double.tryParse(_buyPriceController.text),
                                  double.tryParse(_sellPriceController.text),
                                  _barCodeController.text,
                                  _descriptionController.text,
                                  selectedMedicineType);
                              await Provider.of<MedicinesProvider>(context,
                                      listen: false)
                                  .addMedicine(newMedicine);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Medicine added successfully!')),
                              );
                            }
                            _formKey.currentState!.reset();
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
