import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'CreateAcc.dart';
import 'SignIn.dart';
import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(home: MyApp(),) );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> k= GlobalKey<FormState>();
  String f1="";
  String f2="";
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(


      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 350, width:300,child: Image.asset("assets/images/img.png" )),
              SizedBox(height: 40,width: 40,),
              Text(" Welcome to TORBETNAH Thank you for trust us. ",style: TextStyle(color: Colors.grey
              ),),
              SizedBox(height: 40,width: 30,),
              ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );

              },style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button background color
                foregroundColor: Colors.white,  // Text color
                padding: EdgeInsets.symmetric(horizontal: 101, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ), child: Text("SignIn")),
              SizedBox(height: 30,width: 30,),
              ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePage()),
                );
              },style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button background color
                foregroundColor: Colors.white,  // Text color
                padding: EdgeInsets.symmetric(horizontal: 67, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ), child: Text("Create account")),
            ],
          ),
        ),
      ),
    );

  }
}

