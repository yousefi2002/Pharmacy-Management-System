import 'package:fargard_pharmacy_management_system/models/generic_names.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_generic_name.dart';
import 'package:fargard_pharmacy_management_system/utilities/custom_widgets.dart';
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
                        decoration: MyInputDecoration1(labelText: AppLocalizations.of(context)!.generic_name, hintText: 'Name like Panadol'),
                        style: const TextStyle(
                          color: Colors.black, // Input text color
                          fontSize: 18,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (genericName.id != null) {
                              final updateGenericName = GenericName(genericName.id, _nameController.text, genericName.createdAt);
                              await Provider.of<GenericNameProvider>(context,
                                      listen: false)
                                  .updateGeneric(updateGenericName);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Generic Name updated successfully!')),
                              );
                            } else {
                              final newGeneric = GenericName(genericName.id, _nameController.text);
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
