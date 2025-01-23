import 'package:fargard_pharmacy_management_system/homepage/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Row(
          children: [
            Image.asset("assets/images/Fargard Logo 2025 green v1.png", width: 200, color: Colors.white,),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(AppLocalizations.of(context)!.pharmacy, style: TextStyle(fontSize: 30, color: Colors.white),),
            ),
          ],
        ),
        // title: Text(AppLocalizations.of(context)!.pharmacy, style: TextStyle(fontSize: 35),),
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image:AssetImage(""),fit:BoxFit.fill)
        ),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  maxRadius: 100,
                  backgroundImage: AssetImage("assets/images/Pharmacy Logo.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Login Page",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 400,
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: CupertinoColors.white,width: 3)
                        ),
                        labelText: "Username",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 400,
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: CupertinoColors.white,width: 3)
                        ),
                        labelText: "Password",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 400,
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: CupertinoColors.white,width: 3)
                        ),
                        labelText: "Role",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),)
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed:(){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (b) => HomePage()));
              }, child:Text("Login",style: TextStyle(color: Colors.green),)),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
