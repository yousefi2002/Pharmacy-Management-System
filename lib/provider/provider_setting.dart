import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;


  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _saveThemeToPrefs(isDark);
    notifyListeners();
  }

  Future<void> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDarkMode') ?? false;
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Future<void> _saveThemeToPrefs(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);
  }

  /////////////////////////////////////////////////////////////

   bool _isbuttonenabled=false;
  bool get isbuttonenable=>_isbuttonenabled;

  setting_provider(){
    loadswitchstate();
  }

  void loadswitchstate()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    _isbuttonenabled=prefs.getBool("isbuttonenabled")?? false;notifyListeners();
  }

  void toggleswitche(bool value)async{
    _isbuttonenabled=value;
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setBool("isbuttonenabled", value);
    notifyListeners();
  }

}
