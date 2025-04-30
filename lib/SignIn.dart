import 'package:flutter/material.dart';
import 'package:gp2/FarmerScreen.dart';

import 'CreateAcc.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> k= GlobalKey<FormState>();
  String Email ="";
  String Password ="";
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:Text("Sign In"),centerTitle: true,),
        body: Container(

          padding:EdgeInsets.fromLTRB(25, 0, 25, 0) ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/img.png',height: 200,),
              SizedBox(height: 50,),
              Form(
                  key: k,
                  child: Column(
                    children: [
                      Center(
                        child: Text("Hi! Welcome back, You've been missed ",
                          style: TextStyle(
                              color: Colors.grey

                          ),
                        ),
                      ),
                      TextFormField(
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'please enter Email';
                          }
                          else null;
                        },
                        onChanged: (v){
                          setState(() {
                            Email=v;
                          });
                        },
                        decoration: InputDecoration(
                            label: Text("Email"),
                            hintText: "Enter Email",
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      SizedBox(height: 20,width: 5,),
                      TextFormField(
                        obscureText: _obsecureText,

                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'please enter Your Password';
                          }
                          else null;
                        },
                        onChanged: (v){
                          setState(() {
                            Password=v;
                          });
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              _obsecureText= !_obsecureText;
                            });
                          },icon: Icon(_obsecureText?Icons.visibility:Icons.visibility_off),),
                            label: Text("Password"),
                            hintText: "Enter Password",
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      SizedBox(height: 20,width: 5,),
                      SizedBox(width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Farmerscreen()),
                              );
                            });
                          },style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Button background color
                          foregroundColor: Colors.white,  // Text color
                          padding: EdgeInsets.symmetric(horizontal: 101, vertical: 15),
                          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Rounded corners
                          ),
                        ),child: Text("Sign In"),
                        ),),

                    ],
                  )),
              Column(

                children: [

                  Text("Or sign up with" ,style: TextStyle(color: Colors.grey),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.apple),
                      Icon(Icons.g_mobiledata_sharp),
                      Icon(Icons.facebook),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have account!"),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CreatePage()),
                            );
                          });
                        },child: Text("Sign Up",style: TextStyle(color: Colors.pink),),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*












import 'package:flutter/material.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> k= GlobalKey<FormState>();
  String f1="";
  String f2="";
bool x=true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:Text("Sign In"),centerTitle: true,),
        body: Container(


        alignment: Alignment.center,
        child: Column(children: [
          Form(
          key: k,
        child: Column(
          children: [
            SizedBox(
              width: 200,
              height: 50,
              child: TextFormField(
                validator: v1,
                decoration: InputDecoration(
                  hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),

                )
                ),
                onChanged: (v){
                  setState(() {
                    f1=v;
                  });
                },
              ),
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: TextFormField(
                obscureText: !x,
                validator: v2,
                decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                    )
                ),
                onChanged: (v){
                  setState(() {
                    f2=v;
                  });
                },
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                if(k.currentState!.validate()){
                  if(f1=="tutanji@gmail" && f2 == "1234")
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("tutanjiko")));
                  else
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Not Correct")));}});
            }, child: Text("login"))

              ],
        ),
        )
        ])

    )



        ),
    );
  }
}
String? v1(String? b){
  if(b!=null && b.contains("@asu"))
    return null;
  else
    return "Not ASU mail";}

String? v2(String? b){
  if(b!=null && b.length>0)
    return null;
  else
    return "Enter your password"; }








* */