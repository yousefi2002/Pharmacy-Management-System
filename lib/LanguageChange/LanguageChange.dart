import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChange extends ChangeNotifier {
  Locale? _applocale;

  Locale? get applocale => _applocale;

  LanguageChange() {
    loadSavedLanguage();
  }

  Future<void> loadSavedLanguage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? languageCode = sp.getString("language_code");
    String? countryCode = sp.getString("country_code");

    if (languageCode != null) {
      _applocale = Locale(languageCode, countryCode ?? '');
    } else {
      _applocale = Locale("en", "US");
    }
    notifyListeners();
  }

  Future<void> changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _applocale = type;

    await sp.setString("language_code", type.languageCode);
    await sp.setString("country_code", type.countryCode ?? '');

    notifyListeners();
  }
}
