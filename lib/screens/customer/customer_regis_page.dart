import 'package:fargard_pharmacy_management_system/providers/crud_for_customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../database/database_helper.dart';
import '../../models/customers.dart';
class CustomerPage extends StatefulWidget {
  final Customer customer;
  const CustomerPage(this.customer,{super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState(this.customer);
}

class _CustomerPageState extends State<CustomerPage> {
  final _formKey = GlobalKey<FormState>();
  DatabaseHelper dbHelper = DatabaseHelper();
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final FocusNode focs5 = FocusNode();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Customer customer;
  _CustomerPageState(this.customer);

  @override
  void initState() {
    super.initState();
    nameController.text=customer.name;
    contactController.text=customer.contactNumber;
    emailController.text=customer.email;
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    contactController.dispose();
    emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.new_customer,
        style: const TextStyle(fontSize: 30),),),
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
                      Center(child: Text(AppLocalizations.of(context)!.new_customer,style: TextStyle(fontSize: 35),)),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Customer\'s name';
                          }
                          return null;
                        },
                        controller: nameController,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs1);
                        },
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.customer_name,
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
                            return 'Please enter the Customer\'s Phone number';
                          }
                          return null;
                        },
                        controller: contactController,
                        focusNode: focs1,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs2);
                        },
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
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the Customer\'s address';
                          }
                          return null;
                        },
                        controller: emailController,
                        focusNode: focs2,
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
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if(_formKey.currentState!.validate()){
                                if(customer.id!=null){
                                  String createdAt = DateTime.now().toString();
                                  String updatedAt = DateTime.now().toString();
                                  final updateCustomer=Customer(
                                      nameController.text,
                                      contactController.text,
                                      emailController.text,
                                      createdAt,
                                      updatedAt,
                                    id: customer.id,

                                  );
                                  await Provider.of<CustomerProvider>(context,listen:false)
                                      .updateCustomer(updateCustomer);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Customer updated successfully!')),
                                  );
                                }else{
                                  String createdAt = DateTime.now().toString();
                                  String updatedAt = DateTime.now().toString();
                                  final addCustomer=Customer(nameController.text, contactController.text, emailController.text, createdAt, updatedAt);
                                  await Provider.of<CustomerProvider>(context,listen: false).addCustomer(addCustomer);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Customer added successfully!')),
                                  );
                                }
                                _formKey.currentState!.reset();
                                nameController.clear();
                                contactController.clear();
                                emailController.clear();
                                Navigator.pop(context);

                              }
                            },
                            child: Text(AppLocalizations.of(context)!.save, style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
                          )
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
