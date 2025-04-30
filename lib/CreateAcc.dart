

import 'package:flutter/material.dart';
import 'package:gp2/SignIn.dart';


class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  GlobalKey<FormState> k= GlobalKey<FormState>();
  String Name="";
  String Email="";
  String Password="";
  num Phone=0;
  bool _obsecureText=true;
  bool t=true;
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(
      appBar: AppBar(title: Text("Create Account"),centerTitle: true,),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset('assets/images/img.png',height: 200,),
            Center(child: Text("Fill your information below or register with your social account.",style: TextStyle(color: Colors.grey),)),
           SizedBox(height: 15,),
            TextFormField(
              validator: (value){
                if(value==null || value.isEmpty){
                  return 'please enter Your Password';
                }
                else null;
              },
              onChanged: (v){
                setState(() {
                  Name=v;
                });
              },
              decoration: InputDecoration(
                  label: Text("Name"),
                  hintText: "Enter Your Name",
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

            SizedBox(height: 15,),

            TextFormField(
              validator: (value){
                if(value==null || value.isEmpty){
                  return 'please enter Your Email';
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

            SizedBox(height: 15,),
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

            SizedBox(height: 15,),

            TextFormField(
              validator: (value){
                if(value==null || value.isEmpty){
                  return 'please enter Your Password';
                }
                else null;
              },
              onChanged: (v){
              setState(() {

              });
            },
              decoration: InputDecoration(
                  label: Text("Phone Number"),
                  hintText: "+962 | 7*********",
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
Column(

  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(value: t, onChanged: (value){
          setState(() {
            t=value!;
          });
        }),
        Text("Agree with "),
        GestureDetector(
          child: Text("Terms & Condition",style: TextStyle(
            color: Colors.pink
          ),),

        )

      ],
    )
  ],
),
            SizedBox(width: double.infinity,
              child: ElevatedButton(
                onPressed: (){

                },style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Button background color
                foregroundColor: Colors.white,  // Text color
                padding: EdgeInsets.symmetric(horizontal: 101, vertical: 15),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),child: Text("Sign Up"),
              ),),
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
                            MaterialPageRoute(builder: (context) => SignInPage()),
                          );
                        });
                      },child: Text("Sign in",style: TextStyle(color: Colors.pink),),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ),);
  }
}
