import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider_setting.dart';

class Setting_page extends StatefulWidget {

  const Setting_page({super.key,});

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
    return Scaffold(
      body:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("active button"),
          Consumer<ThemeProvider>(builder: (context,settingprovider,child){
            return Switch(value: settingprovider.isbuttonenable,
                onChanged: (value){
              settingprovider.toggleswitche(value);
            });
          },)
        ],
      ) ,
    );
  }
}
