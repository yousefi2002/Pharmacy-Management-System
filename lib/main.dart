import 'package:fargard_pharmacy_management_system/provider/provider_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LanguageChange/LanguageChange.dart';
import 'homepage/home_page.dart';
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
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.dark,
            ),
            locale: provider.applocale??Locale(local),
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
