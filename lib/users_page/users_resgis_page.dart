import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../modal_classes/users.dart';
import 'crud_for_users.dart';

class UsersRegisterPage extends StatefulWidget {
  final User user;
  const UsersRegisterPage(this.user, {super.key});

  @override
  State<UsersRegisterPage> createState() => _UsersRegisterPageState(this.user);
}

class _UsersRegisterPageState extends State<UsersRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
      appBar: AppBar(
        title: const Text('Edit Patient'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
          child: Container(
            decoration:
                BoxDecoration(border: Border.all(color: CupertinoColors.white)),
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
                      AppLocalizations.of(context)!.employees,
                      style: const TextStyle(fontSize: 35),
                    )),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.username,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))),
                    ),
                    TextFormField(
                      controller: _roleController,
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.role,
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
                      controller: _contactController,
                      decoration: InputDecoration(
                          labelText:
                              AppLocalizations.of(context)!.contact_number,
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
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: 'email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the patient\'s name';
                        }
                        return null;
                      },
                    ),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
