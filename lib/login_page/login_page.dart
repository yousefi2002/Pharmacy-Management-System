import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final List<String> name=["Admin","Pharmacist","Pharmacist Assistant"];
  String? selectvalue;
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
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  width: 400,
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: [
                        Icon(Icons.list,size: 16,color: Colors.lightGreenAccent,),
                        SizedBox(width: 4,),
                        Expanded(child: Text("Select Item",style:
                        TextStyle(fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreenAccent),
                          overflow: TextOverflow.ellipsis,))
                      ],
                    ),
                    items: name.map((String names)=>DropdownMenuItem<String>(
                      value: names,
                      child: Text(
                        names,style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreenAccent,
                      ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ).toList(),
                    value: selectvalue,
                    onChanged:(String? value){
                      setState(() {
                        selectvalue=value;
                      });
                    },

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
