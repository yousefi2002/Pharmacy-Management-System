import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../models/users.dart';
import '../../providers/crud_for_users.dart';

class UsersRegisterPage extends StatefulWidget {
  final User user;
  const UsersRegisterPage(this.user, {super.key});

  @override
  State<UsersRegisterPage> createState() => _UsersRegisterPageState(this.user);
}

class _UsersRegisterPageState extends State<UsersRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final List<String> name=["Admin","Pharmacist","Pharmacist Assistant"];
  String? selectvalue;
  User user;

  _UsersRegisterPageState(this.user);

  @override
  void initState() {
    super.initState();
    _nameController.text = user.name;
    _roleController.text = user.role;
    _contactController.text = user.contactNumber;
    _emailController.text = user.email;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.newEmployee, style: const TextStyle(fontSize: 30),),),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.activeGreen),
                  color: Colors.white
              ),
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
                        AppLocalizations.of(context)!.newEmployee,
                        style: const TextStyle(fontSize: 35),
                      )),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the User\'s name';
                          }
                          return null;
                        },
                        controller: _nameController,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs1);
                        },
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.employee_name,
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
                            return 'Please enter the User\'s Phone number';
                          }
                          return null;
                        },
                        controller: _contactController,
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
                          hintText: 'Phone Like 0799339933',
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
                            return 'Please enter the User\'s Email';
                          }
                          return null;
                        },
                        controller: _emailController,
                        focusNode: focs2,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(focs3);
                        },
                        decoration: InputDecoration(
                          labelText:AppLocalizations.of(context)!.email,
                          labelStyle: const TextStyle(
                            color: Colors.green, // Label text color
                            fontSize: 16,
                          ),
                          hintText: 'Email like ahmad@gmail.com',
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
                      SizedBox(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Icon(Icons.list,size: 16,color: Colors.lightGreenAccent,),
                              SizedBox(width: 4,),
                              Expanded(child: Text("Select Role",style:
                              TextStyle(fontSize: 14,
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
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async{
                              if (_formKey.currentState!.validate()) {

                                if (user.id != null) {
                                  final updatedUser = User(
                                      user.id,
                                      _nameController.text,
                                      _roleController.text,
                                      _contactController.text,
                                      _emailController.text);
                                  await Provider.of<UserProvider>(context, listen: false)
                                      .updateUser(updatedUser);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('User updated successfully!')),
                                  );
                                } else {

                                  final addPatient = User(
                                    user.id,
                                    _nameController.text,
                                  _roleController.text,
                                    _contactController.text,
                                    _emailController.text,
                                  );
                                  await Provider.of<UserProvider>(context, listen: false)
                                      .addUser(addPatient);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('User added successfully!')),
                                  );
                                }

                                _formKey.currentState!.reset();
                                _nameController.clear();
                                _roleController.clear();
                                _contactController.clear();
                                _emailController.clear();

                                Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightGreenAccent),
                            child: Text(
                              AppLocalizations.of(context)!.save,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
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
