import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text(AppLocalizations.of(context)!.about),
     ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/Fargard Logo 2025 green v1.png", height: 300,),
            Center(child: Text("شرکت نرم افزاری و خدمات مشوره دهی آنلاین فرگرد")),
            Center(child: Text("copyright 2025")),
          ],
        ),
      ),
    );
  }
}
