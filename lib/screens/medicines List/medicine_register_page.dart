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

  final TextEditingController _genericSearchController = TextEditingController();
  final TextEditingController _companySearchController = TextEditingController();
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
                                style: const TextStyle(fontSize: 35),
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
                                decoration: MyInputDecoration1(labelText:  AppLocalizations.of(context)!.medicine_name, hintText: 'Name like Panadol'),
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
                                decoration: MyInputDecoration1(labelText: AppLocalizations.of(context)!.description, hintText: 'Name like This is for...'),
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
                                decoration: MyInputDecoration1(labelText: AppLocalizations.of(context)!.type, hintText: 'Name like for Headache'),
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
                                decoration: MyInputDecoration1(labelText: AppLocalizations.of(context)!.price, hintText: 'Name like 3.1'),
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
                                      const Icon(
                                        Icons.list,
                                        size: 16,
                                        color: Colors.lightGreenAccent,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                          child: Text(
                                        genericName ?? 'Select Generic Name',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightGreenAccent),
                                        overflow: TextOverflow.ellipsis,
                                      ),),
                                    ],
                                  ),
                                  dropdownSearchData: DropdownSearchData(
                                    searchController: _genericSearchController,
                                    searchInnerWidgetHeight: 150,
                                    searchInnerWidget: BuildTextFormField(
                                      controller: _genericSearchController,
                                      hint: 'Search for medicines...',
                                      focusNode: null,
                                      requestNode: null,
                                      onChange: (_){},
                                    ),
                                    searchMatchFn: (item, searchValue) {
                                      return item.value!.name.toLowerCase().contains(searchValue.toLowerCase());
                                    },
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
                                      const Icon(Icons.list,size: 16,color: Colors.lightGreenAccent,),
                                      const SizedBox(width: 4,),
                                      Expanded(child: Text(companyName ?? "Select Company Name",style:
                                      const TextStyle(fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightGreenAccent),
                                        overflow: TextOverflow.ellipsis,))
                                    ],
                                  ),
                                  dropdownSearchData: DropdownSearchData(
                                    searchController: _companySearchController,
                                    searchInnerWidgetHeight: 150,
                                    searchInnerWidget: BuildTextFormField(
                                      controller: _companySearchController,
                                      hint: 'Search for medicines...',
                                      focusNode: null,
                                      requestNode: null,
                                      onChange: (value) {},
                                    ),
                                    searchMatchFn: (item, searchValue) {
                                      return item.value!.name.toLowerCase().contains(searchValue.toLowerCase());
                                    },
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
                                          medicine.createdAt
                                      );
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
                                          double.tryParse(_priceController.text) ?? 0.0,
                                          genericName,
                                          companyName);
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
