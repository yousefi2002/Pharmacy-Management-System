import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sqflite/sqflite.dart';

import '../database_manager _folder/database_helper.dart';
import '../modal_classes/customers.dart';
class Customer_regis_page extends StatefulWidget {


  const Customer_regis_page({super.key});

  @override
  State<Customer_regis_page> createState() => _Customer_regis_pageState();
}
class _Customer_regis_pageState extends State<Customer_regis_page> {
  DatabaseHelper dbHelper = DatabaseHelper();

  final FocusNode focs1 = FocusNode();
  final FocusNode focs2 = FocusNode();
  final FocusNode focs3 = FocusNode();
  final FocusNode focs4 = FocusNode();
  final FocusNode focs5 = FocusNode();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.white)
              ),
              width: 600,
              height:600,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 40, 100, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(child: Text(AppLocalizations.of(context)!.register_customer,style: TextStyle(fontSize: 35),)),
                    TextFormField(
                      controller: nameController,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs1);
                      },
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.customer_name,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    TextFormField(
                      controller: ageController,
                      focusNode: focs1,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs2);
                      },
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.age,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    TextFormField(
                      controller: genderController,
                      focusNode: focs2,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs3);
                      },
                      decoration: InputDecoration(
                          labelText:AppLocalizations.of(context)!.gender,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    TextFormField(
                      controller: contactController,
                      focusNode: focs3,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs4);
                      },
                      decoration: InputDecoration(
                          labelText:AppLocalizations.of(context)!.contact_number ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    TextFormField(
                      controller: addressController,
                      focusNode: focs4,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs5);
                      },
                      decoration: InputDecoration(
                          labelText:AppLocalizations.of(context)!.address ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            String name = nameController.text;
                            String contactNumber = contactController.text;
                            String email = '';  // ایمیل را می‌توانید از کاربر بگیرید
                            String createdAt = DateTime.now().toString();
                            String updatedAt = DateTime.now().toString();

                            // ایجاد شیء Customer
                            Customer newCustomer = Customer(name, contactNumber, email, createdAt, updatedAt);

                            // ذخیره مشتری در دیتابیس
                            // await dbHelper.Inse(newCustomer);

                            // نمایش پیام موفقیت یا بازگشت به صفحه قبلی
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Customer added successfully')));
                            Navigator.pop(context);  // بازگشت به صفحه قبلی
                          },
                          child: Text(AppLocalizations.of(context)!.save, style: TextStyle(color: Colors.black)),
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
      ) ,
    );
  }
}
