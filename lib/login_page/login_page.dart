import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image:AssetImage("image/logo.jpg"),fit:BoxFit.fill)
        ),
        child: Container(
          width: 100,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  maxRadius: 100,
                  backgroundImage: AssetImage("image/q.jpg"),
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
              TextButton(onPressed:(){}, child:Text("Login",style: TextStyle(fontSize: 40,color: Colors.green),))
            ],
          ),
        ),
      ),
    );
  }
}
