import 'package:fargard_pharmacy_management_system/models/generic_names.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_generic_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class GenericNameRegisterPage extends StatefulWidget {
  final GenericName genericName;
  const GenericNameRegisterPage(this.genericName, {super.key});

  @override
  State<GenericNameRegisterPage> createState() =>
      _GenericNameRegisterPageState(this.genericName);
}

class _GenericNameRegisterPageState extends State<GenericNameRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final FocusNode focs5 = FocusNode();

  final TextEditingController _nameController = TextEditingController();

  GenericName genericName;

  _GenericNameRegisterPageState(this.genericName);

  @override
  void initState() {
    super.initState();
    _nameController.text = genericName.name;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.register_generic,
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
                        AppLocalizations.of(context)!.register_generic,
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
                              AppLocalizations.of(context)!.generic_names,
                          labelStyle: const TextStyle(
                            color: Colors.green, // Label text color
                            fontSize: 16,
                          ),
                          hintText: 'Name like Panadol',
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
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String createdAt =
                            DateTime.now().toString();
                            String updatedAt =
                            DateTime.now().toString();
                            if (genericName.id != null) {
                              final updateGenericName = GenericName(
                                  genericName.id,
                                  _nameController.text,
                                  createdAt,
                                  updatedAt);
                              await Provider.of<GenericNameProvider>(context,
                                      listen: false)
                                  .updateGeneric(updateGenericName);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Generic Name updated successfully!')),
                              );
                            } else {
                              final newGeneric = GenericName(
                                  genericName.id,
                                  _nameController.text,
                                  createdAt,
                                  updatedAt);
                              await Provider.of<GenericNameProvider>(context,
                                      listen: false)
                                  .addGeneric(newGeneric);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Generic Name added successfully!')),
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
