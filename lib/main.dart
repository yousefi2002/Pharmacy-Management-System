import 'package:fargard_pharmacy_management_system/homepage/home_page.dart';
import 'package:fargard_pharmacy_management_system/login_page/login_page.dart';
import 'package:fargard_pharmacy_management_system/provider/provider_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LanguageChange/LanguageChange.dart';


void main() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  final String languageCode = sp.getString("language_code") ?? "en";

  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
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
