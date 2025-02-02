import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/LanguageChange.dart';
import '../providers/provider_setting.dart';
import 'home_page.dart';

class Setting_page extends StatefulWidget {
  const Setting_page({
    super.key,
  });

  @override
  State<Setting_page> createState() => _Setting_pageState();
}

class _Setting_pageState extends State<Setting_page> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> card = [
      {
        "title": "زبان",
        "trailing":cansumer(),
      },
    ];
    final themProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                gradient: LinearGradient(colors: [
                  Colors.green,
                  Colors.greenAccent,
                ])),
            width: 600,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text("active button"),
                  // Consumer<ThemeProvider>(
                  //   builder: (context, settingprovider, child) {
                  //     return Switch(
                  //       inactiveThumbColor: Colors.red,
                  //       activeColor: Colors.green,
                  //       activeTrackColor: Colors.yellow,
                  //       hoverColor: Colors.white38,
                  //       inactiveTrackColor: Colors.yellow,
                  //       value: settingprovider.isbuttonenable,
                  //       onChanged: (value) {
                  //         settingprovider.toggleswitche(value);
                  //       },
                  //     );
                  //   },
                  // ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: card.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            trailing:card[index]["trailing"],
                            title:Text(card[index]["title"]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  cansumer(){
    Consumer<LanguageChange>(
      builder: (context, provider, child) {
        return PopupMenuButton(
          icon: Icon(
            Icons.language,
            size: 35,
            color: Colors.green,
          ),
          onSelected: (Language item) {
            if (Language.english.name == item.name) {
              provider.changeLanguage(Locale("en"));
            } else if (Language.farsi.name == item.name) {
              provider.changeLanguage(Locale("fa"));
            } else if (Language.pashto.name == item.name) {
              provider.changeLanguage(Locale("ps"));
            }
          },
          itemBuilder: (context) => <PopupMenuEntry<Language>>[
            PopupMenuItem(
              value: Language.farsi,
              child: Row(
                children: [
                  Text("فارسی"),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/images/afghanistan.png",
                    width: 30,
                  ),
                ],
              ),
            ),
            PopupMenuItem(
              value: Language.english,
              child: Row(
                children: [
                  Text("English"),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/images/england.png",
                    width: 30,
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
//
// Switch(
// activeTrackColor: Colors.green,
// inactiveTrackColor: Colors.green,
// activeColor: Colors.white,
// inactiveThumbColor: Colors.white,
// activeThumbImage: AssetImage(
// "assets/images/crescent-moon.png"),
// inactiveThumbImage:
// AssetImage("assets/images/sun.png"),
// value: themProvider.themeMode == ThemeMode.dark,
// onChanged: (value) {
// themProvider.toggleTheme(value);
// }),
