import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fargard_pharmacy_management_system/models/generic_names.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_company_name.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_generic_name.dart';
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
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _genericIdController = TextEditingController();
  final TextEditingController _companyIdController = TextEditingController();

  Medicine medicine;
  String? companyName;
  String? genericName;

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
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.register_medicine,
          style: const TextStyle(fontSize: 30),
        ),
      ),
      body: Consumer<GenericNameProvider>(
        builder: (context, generic, child) {
          final genericInfo = generic.genericName;
          return Consumer<CompanyProvider>(
            builder: (context, company, child) {
              final companyInfo = company.company;
              return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
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
                                AppLocalizations.of(context)!.register_medicine,
                                style: TextStyle(fontSize: 35),
                              )),

                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Customer\'s name';
                                  }
                                  return null;
                                },
                                controller: _nameController,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(focs1);
                                },
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)!
                                      .medicine_name,
                                  labelStyle: const TextStyle(
                                    color: Colors.green, // Label text color
                                    fontSize: 16,
                                  ),
                                  hintText: 'Name like Panadol',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey), // Hint text color
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .greenAccent, // Border color when not focused
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .green, // Border color when focused
                                      width: 2,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color:
                                          Colors.red, // Border color on error
                                      width: 2,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .redAccent, // Border color on focused error
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ), // Inner padding
                                  filled: true,
                                  fillColor:
                                      Colors.green.shade50, // Background color
                                ),
                                style: const TextStyle(
                                  color: Colors.black, // Input text color
                                  fontSize: 18,
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Customer\'s name';
                                  }
                                  return null;
                                },
                                controller: _descriptionController,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(focs2);
                                },
                                decoration: InputDecoration(
                                  labelText:
                                      AppLocalizations.of(context)!.description,
                                  labelStyle: const TextStyle(
                                    color: Colors.green, // Label text color
                                    fontSize: 16,
                                  ),
                                  hintText: 'Name like This is for...',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey), // Hint text color
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .greenAccent, // Border color when not focused
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .green, // Border color when focused
                                      width: 2,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color:
                                          Colors.red, // Border color on error
                                      width: 2,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .redAccent, // Border color on focused error
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ), // Inner padding
                                  filled: true,
                                  fillColor:
                                      Colors.green.shade50, // Background color
                                ),
                                style: const TextStyle(
                                  color: Colors.black, // Input text color
                                  fontSize: 18,
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Customer\'s name';
                                  }
                                  return null;
                                },
                                controller: _typeController,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(focs3);
                                },
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)!.type,
                                  labelStyle: const TextStyle(
                                    color: Colors.green, // Label text color
                                    fontSize: 16,
                                  ),
                                  hintText: 'Name like for Headache',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey), // Hint text color
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .greenAccent, // Border color when not focused
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .green, // Border color when focused
                                      width: 2,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color:
                                          Colors.red, // Border color on error
                                      width: 2,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .redAccent, // Border color on focused error
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ), // Inner padding
                                  filled: true,
                                  fillColor:
                                      Colors.green.shade50, // Background color
                                ),
                                style: const TextStyle(
                                  color: Colors.black, // Input text color
                                  fontSize: 18,
                                ),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the Customer\'s name';
                                  }
                                  return null;
                                },
                                controller: _priceController,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(focs4);
                                },
                                decoration: InputDecoration(
                                  labelText:
                                      AppLocalizations.of(context)!.price,
                                  labelStyle: const TextStyle(
                                    color: Colors.green, // Label text color
                                    fontSize: 16,
                                  ),
                                  hintText: 'Name like 3.1',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey), // Hint text color
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .greenAccent, // Border color when not focused
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        5), // Rounded border
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .green, // Border color when focused
                                      width: 2,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color:
                                          Colors.red, // Border color on error
                                      width: 2,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                      color: Colors
                                          .redAccent, // Border color on focused error
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 12.0,
                                  ), // Inner padding
                                  filled: true,
                                  fillColor:
                                      Colors.green.shade50, // Background color
                                ),
                                style: const TextStyle(
                                  color: Colors.black, // Input text color
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                child: DropdownButton2<GenericName>(
                                  isExpanded: true,
                                  items: genericInfo
                                      .map(
                                        (genericNameGen) =>
                                            DropdownMenuItem<GenericName>(
                                          value: genericNameGen,
                                          child: Text(
                                            genericNameGen.name,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.lightGreen,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      genericName = value?.name ?? '';
                                    });
                                  },
                                  hint: Row(
                                    children: [
                                      Icon(
                                        Icons.list,
                                        size: 16,
                                        color: Colors.lightGreenAccent,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                          child: Text(
                                        genericName ?? 'Select Generic Name',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightGreenAccent),
                                        overflow: TextOverflow.ellipsis,
                                      ))
                                    ],
                                  ),
                                  dropdownSearchData: DropdownSearchData(
                                    // searchController: _searchController,
                                    searchInnerWidgetHeight: 150,
                                    searchInnerWidget: BuildTextFormField(
                                      controller: null,
                                      hint: 'Search for medicines...',
                                      focusNode: null,
                                      requestNode: null,
                                      onChange: (value) {
                                        // medicinesProvider.searchMedicines(value);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: DropdownButton2<Company>(
                                  isExpanded: true,
                                  items: companyInfo.map((companyNameCom) => DropdownMenuItem<Company>(
                                    value: companyNameCom,
                                    child: Text(companyNameCom.name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightGreen,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  ).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      companyName = value?.name ?? '';
                                    });
                                  },
                                  hint: Row(
                                    children: [
                                      Icon(Icons.list,size: 16,color: Colors.lightGreenAccent,),
                                      SizedBox(width: 4,),
                                      Expanded(child: Text(companyName ?? "Select Company Name",style:
                                      TextStyle(fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightGreenAccent),
                                        overflow: TextOverflow.ellipsis,))
                                    ],
                                  ),
                                  dropdownSearchData: DropdownSearchData(
                                    // searchController: _searchController,
                                    searchInnerWidgetHeight: 150,
                                    searchInnerWidget: BuildTextFormField(
                                      controller: null,
                                      hint: 'Search for medicines...',
                                      focusNode: null,
                                      requestNode: null,
                                      onChange: (value) {
                                        // medicinesProvider.searchMedicines(value);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    String createdAt =
                                        DateTime.now().toString();
                                    String updatedAt =
                                        DateTime.now().toString();
                                    if (medicine.id != null) {
                                      final updatedMedicine = Medicine(
                                          medicine.id,
                                          _nameController.text,
                                          _descriptionController.text,
                                          _typeController.text,
                                          double.tryParse(
                                                  _priceController.text) ??
                                              0.0,
                                          genericName,
                                          companyName,
                                          createdAt,
                                          updatedAt);
                                      await Provider.of<MedicinesProvider>(
                                              context,
                                              listen: false)
                                          .updateMedicine(updatedMedicine);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Medicine updated successfully!')),
                                      );
                                    } else {
                                      final newMedicine = Medicine(
                                          medicine.id,
                                          _nameController.text,
                                          _descriptionController.text,
                                          _typeController.text,
                                          double.tryParse(
                                                  _priceController.text) ??
                                              0.0,
                                          genericName,
                                          companyName,
                                          createdAt,
                                          updatedAt);
                                      await Provider.of<MedicinesProvider>(
                                              context,
                                              listen: false)
                                          .addMedicine(newMedicine);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Medicine added successfully!')),
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
              );
            },
          );
        },
      ),
    );
  }
}
