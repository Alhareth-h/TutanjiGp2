import 'package:flutter/material.dart';
import 'package:gp2/Feedback.dart';
class Farmerscreen extends StatefulWidget {
  const Farmerscreen({super.key});

  @override
  State<Farmerscreen> createState() => _FarmerscreenState();
}

class _FarmerscreenState extends State<Farmerscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
      drawer: Drawer(),
        appBar: AppBar(title: Text("Farmer"),centerTitle: true,),
      body: SingleChildScrollView(
        child: Container(
          child: Column(

            children: [

              Text("Hi Tutanji! Welcome to TORBETNAH",style: TextStyle(color: Colors.grey),),
        Padding(
          padding: const EdgeInsets.all(100),
          child: Text("We're excited to have you here! At TORBETNAH, we're all about bringing people together. Whether you're here to learn, share, or just explore, you're part of our community. Let's make amazing things happen together!",style: TextStyle(color: Colors.grey,)),
        ),
        Row(children: [
          Expanded(child: Container(
            margin: EdgeInsets.all(50),
            padding: EdgeInsets.all(50),
        
        
            child: Column(
        children: [
          SizedBox(child: Image.asset("assets/images/img.png" )),
          TextButton(onPressed: (){
        
          }, child: Text("Disease Diagnosis "))
        ],
            ),
          )),
          Expanded(child: Container(
            margin: EdgeInsets.all(50),
            padding: EdgeInsets.all(50),
        
            child: Column(
        children: [
          SizedBox(child: Image.asset("assets/images/img.png" )),
          TextButton(onPressed: (){
        
          }, child: Text("Notifications "))
        ],
            ),
          ))
        ],),
        
              Row(children: [
                Expanded(child: Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(50),
        
        
                  child: Column(
                    children: [
                      SizedBox(child: Image.asset("assets/images/img.png" )),
                      TextButton(onPressed: (){
        
                      }, child: Text("Ai Scan "))
                    ],
                  ),
                )),
                Expanded(child: Container(
                  margin: EdgeInsets.all(50),
                  padding: EdgeInsets.all(50),
        
                  child: Column(
                    children: [
                      SizedBox(child: Image.asset("assets/images/img.png" )),
                      TextButton(onPressed: (){
        
                      }, child: Text("View Plants"))
                    ],
                  ),
                ))
              ],),
              Row(children: [
                Expanded(child: Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(50),
        
        
                  child: Column(
                    children: [
                      SizedBox(child: Image.asset("assets/images/img.png" )),
                      TextButton(onPressed: (){}, child: Text("Calculate "))
                    ],
                  ),
                )),
                Expanded(child: Container(
                  margin: EdgeInsets.all(50),
                  padding: EdgeInsets.all(50),
                  child: Column(
                    children: [
                      SizedBox(child: Image.asset("assets/images/img.png" )),
                      TextButton(onPressed: (){}, child: Text("Agricultural Service "))
                    ],
                  ),
                ))
              ],),
              Padding(
                padding: const EdgeInsets.all(70),
                child: SizedBox(

                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Feedback1()),
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
                  ),child: Text("Feedback"),
                  ),),
              ),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
      ),
    );
  }
}
