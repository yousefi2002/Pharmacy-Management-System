import 'package:fargard_pharmacy_management_system/models/companies.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_company_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CompaniesRegisterPage extends StatefulWidget {
  final Company company;
  const CompaniesRegisterPage(this.company, {super.key});

  @override
  State<CompaniesRegisterPage> createState() =>
      _CompaniesRegisterPageState(this.company);
}

class _CompaniesRegisterPageState extends State<CompaniesRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final FocusNode focs5 = FocusNode();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  Company company;

  _CompaniesRegisterPageState(this.company);

  @override
  void initState() {
    super.initState();
    _nameController.text = company.name;
    _addressController.text = company.address;
    _contactNumberController.text = company.contactNumber;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _contactNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.register_companies,
          style: const TextStyle(fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
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
                            AppLocalizations.of(context)!.register_companies,
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
                          labelText:
                          AppLocalizations.of(context)!.company_name,
                          labelStyle: const TextStyle(
                            color: Colors.green, // Label text color
                            fontSize: 16,
                          ),
                          hintText: 'Name like Afghan Pharma',
                          hintStyle: const TextStyle(
                              color: Colors.grey), // Hint text color
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(5), // Rounded border
                            borderSide: const BorderSide(
                              color: Colors
                                  .greenAccent, // Border color when not focused
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(5), // Rounded border
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
                            return 'Please enter the Customer\'s name';
                          }
                          return null;
                        },
                        controller: _addressController,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs2);
                        },
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.address,
                          labelStyle: const TextStyle(
                            color: Colors.green, // Label text color
                            fontSize: 16,
                          ),
                          hintText: 'Name like Herat, Afghanistan',
                          hintStyle: const TextStyle(
                              color: Colors.grey), // Hint text color
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(5), // Rounded border
                            borderSide: const BorderSide(
                              color: Colors
                                  .greenAccent, // Border color when not focused
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(5), // Rounded border
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
                            return 'Please enter the Customer\'s name';
                          }
                          return null;
                        },
                        controller: _contactNumberController,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs3);
                        },
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.type,
                          labelStyle: const TextStyle(
                            color: Colors.green, // Label text color
                            fontSize: 16,
                          ),
                          hintText: 'Name like +93 777 777 777',
                          hintStyle: const TextStyle(
                              color: Colors.grey), // Hint text color
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(5), // Rounded border
                            borderSide: const BorderSide(
                              color: Colors
                                  .greenAccent, // Border color when not focused
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(5), // Rounded border
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
                          fillColor: Colors.green.shade50, // Background color
                        ),
                        style: const TextStyle(
                          color: Colors.black, // Input text color
                          fontSize: 18,
                        ),
                      ),
                      // SizedBox(
                      //   child: DropdownButton2<GenericName>(
                      //     isExpanded: true,
                      //     items: genericInfo
                      //         .map(
                      //           (genericNameGen) =>
                      //           DropdownMenuItem<GenericName>(
                      //             value: genericNameGen,
                      //             child: Text(
                      //               genericNameGen.name,
                      //               style: const TextStyle(
                      //                 fontSize: 14,
                      //                 fontWeight: FontWeight.bold,
                      //                 color: Colors.lightGreen,
                      //               ),
                      //               overflow: TextOverflow.ellipsis,
                      //             ),
                      //           ),
                      //     )
                      //         .toList(),
                      //     onChanged: (value) {
                      //       setState(() {
                      //         genericName = value?.name ?? '';
                      //       });
                      //     },
                      //     hint: const Row(
                      //       children: [
                      //         Icon(
                      //           Icons.list,
                      //           size: 16,
                      //           color: Colors.lightGreenAccent,
                      //         ),
                      //         SizedBox(
                      //           width: 4,
                      //         ),
                      //         Expanded(
                      //             child: Text(
                      //               "Select Generic Name",
                      //               style: TextStyle(
                      //                   fontSize: 14,
                      //                   fontWeight: FontWeight.bold,
                      //                   color: Colors.lightGreenAccent),
                      //               overflow: TextOverflow.ellipsis,
                      //             ))
                      //       ],
                      //     ),
                      //     dropdownSearchData: DropdownSearchData(
                      //       // searchController: _searchController,
                      //       searchInnerWidgetHeight: 150,
                      //       searchInnerWidget: BuildTextFormField(
                      //         controller: null,
                      //         hint: 'Search for medicines...',
                      //         focusNode: null,
                      //         requestNode: null,
                      //         onChange: (value) {
                      //           // medicinesProvider.searchMedicines(value);
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   child: DropdownButton2<Company>(
                      //     isExpanded: true,
                      //     items: companyInfo.map((companyNameCom) => DropdownMenuItem<Company>(
                      //       value: companyNameCom,
                      //       child: Text(companyNameCom.name,
                      //         style: const TextStyle(
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.lightGreen,
                      //         ),
                      //         overflow: TextOverflow.ellipsis,
                      //       ),
                      //     ),
                      //     ).toList(),
                      //     onChanged: (value) {
                      //       setState(() {
                      //         companyName = value?.name ?? '';
                      //       });
                      //     },
                      //     hint: const Row(
                      //       children: [
                      //         Icon(Icons.list,size: 16,color: Colors.lightGreenAccent,),
                      //         SizedBox(width: 4,),
                      //         Expanded(child: Text("Select Company Name",style:
                      //         TextStyle(fontSize: 14,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.lightGreenAccent),
                      //           overflow: TextOverflow.ellipsis,))
                      //       ],
                      //     ),
                      //     dropdownSearchData: DropdownSearchData(
                      //       // searchController: _searchController,
                      //       searchInnerWidgetHeight: 150,
                      //       searchInnerWidget: BuildTextFormField(
                      //         controller: null,
                      //         hint: 'Search for medicines...',
                      //         focusNode: null,
                      //         requestNode: null,
                      //         onChange: (value) {
                      //           // medicinesProvider.searchMedicines(value);
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String createdAt = DateTime.now().toString();
                            String updatedAt = DateTime.now().toString();
                            if (company.id != null) {
                              final updateCompany = Company(
                              company.id,
                              _nameController.text,
                              _addressController.text,
                              _contactNumberController.text,
                              createdAt,
                              updatedAt);
                              await Provider.of<CompanyProvider>(context, listen: false).updateCompanies(updateCompany);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                    Text('Company updated successfully!')),
                              );
                            } else {
                              final newCompany = Company(
                                  company.id,
                                  _nameController.text,
                                  _addressController.text,
                                  _contactNumberController.text,
                                  createdAt,
                                  updatedAt);
                              await Provider.of<CompanyProvider>(context,
                                  listen: false)
                                  .addCompanies(newCompany);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                    Text('Company added successfully!')),
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
