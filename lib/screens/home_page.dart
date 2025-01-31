import 'package:fargard_pharmacy_management_system/screens/backup_page.dart';
import 'package:fargard_pharmacy_management_system/screens/patients_page/patients_List_page.dart';
import 'package:fargard_pharmacy_management_system/screens/purches_page/purchese_List_page.dart';
import 'package:fargard_pharmacy_management_system/screens/reports/reports_page.dart';
import 'package:fargard_pharmacy_management_system/screens/sales_page/sales_List_page.dart';
import 'package:fargard_pharmacy_management_system/screens/sales_page/sales_page.dart';
import 'package:fargard_pharmacy_management_system/screens/users_page/users_List_page.dart';
import 'package:fargard_pharmacy_management_system/screens/visit_page/visit_List_page.dart';
import 'package:fargard_pharmacy_management_system/screens/visit_page/visit_regis_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/LanguageChange.dart';
import '../providers/provider_setting.dart';
import 'Setting_page.dart';
import 'Stock_page_of_medicine/stock_page_of_medicine.dart';
import 'about_page.dart';
import 'customer/customer_List_page.dart';
import 'doctors_page/doctprs_List_page.dart';
import 'expenses_page/expenses_List_page.dart';
import 'medicines List/medicines List.dart';
enum Language { english, farsi, pashto }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int count;
  late double iconSize;
  late double appTitleSize;
  bool language_and_theme_visibliliy = true;
  bool add_buttons_in_header_visibility = true;
  bool status_bar_visibility = true;

  List<Map<String, dynamic>> pages(BuildContext context) => [
        {
          "name": AppLocalizations.of(context)!.medicines,
          "icon": Icons.medication_outlined,
          "navigate": MedicinesList(),
        },
        {
          "name": AppLocalizations.of(context)!.stock,
          "icon": Icons.inventory_2_outlined,
          "navigate": StockPageOfMedicine(),
        },
        {
          "name": AppLocalizations.of(context)!.purchase_invoices,
          "icon": Icons.inventory_outlined,
          "navigate": PurchaseListPage(),
        },
        {
          "name": AppLocalizations.of(context)!.sales_invoices,
          "icon": Icons.sell_outlined,
          "navigate": Sales_List_page(),
        },
        {
          "name": AppLocalizations.of(context)!.visits,
          "icon": Icons.meeting_room_outlined,
          "navigate": VisitListPage(),
        },
        {
          "name": AppLocalizations.of(context)!.expenses,
          "icon": Icons.event_busy,
          "navigate": ExpensesListPage(),
        },
        {
          "name": AppLocalizations.of(context)!.customers,
          "icon": Icons.person_2_outlined,
          "navigate": CustomerListPage(),
        },
        {
          "name": AppLocalizations.of(context)!.patients,
          "icon": Icons.person_add_alt,
          "navigate": PatientsListPage(),
        },
        {
          "name": AppLocalizations.of(context)!.doctors,
          "icon": Icons.person_pin_rounded,
          "navigate": Doctors_List_page(),
        },
        {
          "name": AppLocalizations.of(context)!.employees,
          "icon": Icons.person_pin,
          "navigate": UsersListPage(),
        },
        {
          "name": AppLocalizations.of(context)!.reports,
          "icon": Icons.report,
          "navigate": All_reports_page(),
        },
        {
          "name": AppLocalizations.of(context)!.backup,
          "icon": Icons.backup,
          "navigate": BackupPage(),
        },
        {
          "name": AppLocalizations.of(context)!.settings,
          "icon": Icons.settings,
          "navigate": Setting_page(),
        },
        {
          "name": AppLocalizations.of(context)!.about,
          "icon": Icons.info_outline,
          "navigate": AboutPage(),
        },
      ];

  @override
  Widget build(BuildContext context) {
    final pagesList = pages(context);
    final themProvider = Provider.of<ThemeProvider>(context);
    final spaceBettweenHeaderButtons = 10.0;
    mediaQueries(context);

    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          height: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // app logo
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/Pharmacy Logo.png"),
                  radius: 50,
                ),
              ),
              SizedBox(
                width: spaceBettweenHeaderButtons,
              ),
              // app name
              Text(
                AppLocalizations.of(context)!.pharmacy_name,
                style: TextStyle(fontSize: appTitleSize, fontFamily: "Nazanin"),
              ),
              Expanded(child: SizedBox()),
              // language button
              Visibility(
                visible: language_and_theme_visibliliy,
                child: Row(
                  children: [
                    Consumer<LanguageChange>(
                        builder: (context, provider, child) {
                      return PopupMenuButton(
                        icon: Icon(
                          Icons.language,
                          size: 35,
                          color: Colors.grey[700],
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
                                )
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
                    }),
                  ],
                ),
              ),
              // theme button
              Visibility(
                visible: language_and_theme_visibliliy,
                child: Row(
                  children: [
                    Switch(
                        activeColor: Colors.white,
                        inactiveThumbColor: Colors.white,
                        activeThumbImage:
                            AssetImage("assets/images/crescent-moon.png"),
                        inactiveThumbImage: AssetImage("assets/images/sun.png"),
                        value: themProvider.themeMode == ThemeMode.dark,
                        onChanged: (value) {
                          themProvider.toggleTheme(value);
                        }),
                  ],
                ),
              ),
              SizedBox(
                width: spaceBettweenHeaderButtons,
              ),
              // add sale button
              Visibility(
                visible: add_buttons_in_header_visibility,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SalesPage(),
                              ));
                        },
                        child: Icon(Icons.add),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(AppLocalizations.of(context)!.sale)
                  ],
                ),
              ),
              SizedBox(
                width: spaceBettweenHeaderButtons,
              ),
              // add visit button
              Visibility(
                visible: add_buttons_in_header_visibility,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VisitPage(),
                              ));
                        },
                        child: Icon(Icons.add),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(AppLocalizations.of(context)!.visit)
                  ],
                ),
              ),
              SizedBox(
                width: spaceBettweenHeaderButtons,
              ),
              // add visit button
              Visibility(
                visible: add_buttons_in_header_visibility,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VisitPage(),
                              ));
                        },
                        child: Icon(Icons.add),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(AppLocalizations.of(context)!.newexpense)
                  ],
                ),
              ),
              SizedBox(
                width: spaceBettweenHeaderButtons,
              ),
            ],
          ),
        ),
        //Section #2: statistics
        Visibility(
          visible: status_bar_visibility,
          child: Container(
            color: Colors.green[50],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  title_with_amount(
                      context, AppLocalizations.of(context)!.daily_sales, "223 ؋"),
                  title_with_amount(context,
                      AppLocalizations.of(context)!.daily_purchases, "256 ؋"),
                  title_with_amount(context,
                      AppLocalizations.of(context)!.daily_expenses, "234 ؋"),
                  title_with_amount(context,
                      AppLocalizations.of(context)!.doctor_accounts, "123 ؋"),
                  title_with_amount(context,
                      AppLocalizations.of(context)!.cash_inventory, "1222 ؋"),
                  title_with_amount(context,
                      AppLocalizations.of(context)!.backup, "1403/11/11")
                ],
              ),
            ),
          ),
        ),
        //Section #3: options
        Expanded(
          child: GridView.count(
            childAspectRatio: 0.9,
            padding: const EdgeInsets.all(28.0),
            crossAxisCount: count,
            mainAxisSpacing: 0,
            children: pagesList
                .map(
                  (page) => Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => page["navigate"]),
                              );
                            },
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: Icon(
                                  page['icon'],
                                  size: iconSize,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(page['name'])
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    ));
  }

  mediaQueries(context) {
    // Get the screen size
    var screenSize = MediaQuery.of(context).size;
    if (screenSize.width < 400) {
        count = 2; // Small phones
        iconSize = 24;
        language_and_theme_visibliliy = false;
        add_buttons_in_header_visibility = false;
        status_bar_visibility = false;
        appTitleSize = 16;
      } else if (screenSize.width < 600) {
        count = 3; // Larger phones and small tablets
        iconSize = 32;
        language_and_theme_visibliliy = false;
        add_buttons_in_header_visibility = false;
        status_bar_visibility = false;
        appTitleSize = 18;
      } else if (screenSize.width < 900) {
        count = 4; // Medium tablets
        iconSize = 40;
        language_and_theme_visibliliy = false;
        add_buttons_in_header_visibility = true;
        status_bar_visibility = false;
        appTitleSize = 22;
      } else if (screenSize.width < 1200) {
        count = 6; // Large tablets and desktops
        iconSize = 48;
        language_and_theme_visibliliy = true;
        add_buttons_in_header_visibility = true;
        status_bar_visibility = true;
        appTitleSize = 26;
      } else {
        count = 8; // Large tablets and desktops
        iconSize = 58;
        language_and_theme_visibliliy = true;
        add_buttons_in_header_visibility = true;
        status_bar_visibility = true;
        appTitleSize = 28;
      }
  }
}

Widget title_with_amount(context, title, amount) {
  var fontSize = 18.0;
  return Row(
    children: [
      Text(
        title,
        style: TextStyle(fontSize: fontSize),
      ),
      Text(
        " | ",
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
      Text(
        amount.toString(),
        style: TextStyle(fontSize: fontSize, color: Colors.green),
      ),
    ],
  );
}
