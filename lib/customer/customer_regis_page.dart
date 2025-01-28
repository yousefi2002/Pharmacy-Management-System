import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.new_customer, style: const TextStyle(fontSize: 30),),),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(child: Text(AppLocalizations.of(context)!.new_customer,style: TextStyle(fontSize: 35),)),
                    TextFormField(
                      controller: nameController,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs1);
                      },
                      decoration: InputDecoration(
                        labelText: 'Customer Name',
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
                      controller: ageController,
                      focusNode: focs1,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs2);
                      },
                      decoration: InputDecoration(
                        labelText: 'Age',
                        labelStyle: const TextStyle(
                          color: Colors.green, // Label text color
                          fontSize: 16,
                        ),
                        hintText: 'Age like 27',
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
                      controller: genderController,
                      focusNode: focs2,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs3);
                      },
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        labelStyle: const TextStyle(
                          color: Colors.green, // Label text color
                          fontSize: 16,
                        ),
                        hintText: 'Gender like Male',
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
                      controller: contactController,
                      focusNode: focs3,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs4);
                      },
                      decoration: InputDecoration(
                        labelText: 'Contact',
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
                      controller: addressController,
                      focusNode: focs4,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(focs5);
                      },
                      decoration: InputDecoration(
                        labelText: 'Address',
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
                            String name = nameController.text;
                            String contactNumber = contactController.text;
                            String email = '';  // ایمیل را می‌توانید از کاربر بگیرید
                            String createdAt = DateTime.now().toString();
                            String updatedAt = DateTime.now().toString();

                            // ایجاد شیء Customer
                            // Customer newCustomer = Customer(name, contactNumber, email, createdAt, updatedAt);

                            // ذخیره مشتری در دیتابیس
                            // await dbHelper.Inse(newCustomer);

                            // نمایش پیام موفقیت یا بازگشت به صفحه قبلی
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Customer added successfully')));
                            Navigator.pop(context);  // بازگشت به صفحه قبلی
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
      ) ,
    );
  }
}
