import 'package:fargard_pharmacy_management_system/providers/LanguageChange.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_company_name.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_generic_name.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_sales_detail.dart';
import 'package:fargard_pharmacy_management_system/providers/crud_for_supplier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'providers/crud_for_customer.dart';
import 'providers/crud_for_doctor.dart';
import 'providers/crud_for_expenses.dart';
import 'providers/crud_for_medicines.dart';
import 'providers/crud_for_patients.dart';
import 'providers/crud_for_purchase.dart';
import 'providers/crud_for_purchase_detai.dart';
import 'providers/crud_for_sales.dart';
import 'providers/crud_for_stock.dart';
import 'providers/crud_for_users.dart';
import 'providers/provider_setting.dart';
import 'screens/home_page.dart';

void main() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  final String languageCode = sp.getString("language_code") ?? "en";
  // WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider(),),
      ChangeNotifierProvider(create: (_) => PatientProvider(),),
      ChangeNotifierProvider(create: (_) => UserProvider(),),
      ChangeNotifierProvider(create: (_) => ExpensesProvider(),),
      ChangeNotifierProvider(create: (_) => CustomerProvider(),),
      ChangeNotifierProvider(create: (_) => DoctorProvider(),),
      ChangeNotifierProvider(create: (_) => MedicinesProvider(),),
      ChangeNotifierProvider(create: (_) => SalesProvider(),),
      ChangeNotifierProvider(create: (_) => SalesDetailProvider(),),
      ChangeNotifierProvider(create: (_) => PurchasesProvider(),),
      ChangeNotifierProvider(create: (_) => PurchasesDetailProvider(),),
      ChangeNotifierProvider(create: (_) => StockProvider(),),
      ChangeNotifierProvider(create: (_) => CompanyProvider(),),
      ChangeNotifierProvider(create: (_) => GenericNameProvider(),),
      ChangeNotifierProvider(create: (_) => SupplierProvider(),),
    ],
    child: MyApp(
      local: languageCode,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final String local;
  const MyApp({super.key, required this.local});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageChange()),
      ],
      child: Consumer<LanguageChange>(
        builder: (context, provider, child) {
          if (local.isNotEmpty && provider.applocale == null) {
            provider.changeLanguage(Locale(local));
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              primaryColor: Colors.green[200],
              primarySwatch: Colors.green,
              brightness: Brightness.light,
              scaffoldBackgroundColor: Colors.grey[100],
              appBarTheme: AppBarTheme(color: Colors.green[200], toolbarHeight: 80),
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.green,
                accentColor: Colors.white,
                brightness: Brightness.light, // Light or dark mode
              ),
            ),
            darkTheme: ThemeData(
              primaryColor: Colors.green[400],
              primarySwatch: Colors.green,
              brightness: Brightness.dark,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.green,
                accentColor: Colors.white,
                brightness: Brightness.dark, // Light or dark mode
              ),
            ),
            locale: provider.applocale ?? Locale(local),
            localizationsDelegates: [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'), // English
              Locale('fa'), // Spanish
            ],
            home: HomePage(),
          );
        },
      ),
    );
  }
}
