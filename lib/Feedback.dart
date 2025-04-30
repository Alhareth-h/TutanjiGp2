


import 'package:flutter/material.dart';
class Feedback1 extends StatefulWidget {
  const Feedback1({super.key});

  @override
  State<Feedback1> createState() => _Feedback1State();
}

class _Feedback1State extends State<Feedback1> {

  var Name="";
  var Feedback="";
  var Phone="";

  @override


  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title: Text("Feedback"),centerTitle: true,),
        body: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              Text("Please fill the following fields:",style: TextStyle(color: Colors.grey),),
              SizedBox(height: 50,),
              TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'please enter Your Name';
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
                    hintText: "Enter Name",
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
              ), SizedBox(height: 30,),
              TextFormField(
                validator: (value){
                  if(value==null || value.isEmpty){
                    return 'please enter Your Phone Number';
                  }
                  else null;
                },
                onChanged: (v){
                  setState(() {
                    Phone=v;
                  });
                },
                decoration: InputDecoration(
                    label: Text("Phone Number"),
                    hintText: "Enter Phone Number",
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
SizedBox(height: 30,),
              TextFormField(

                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'please enter Your Feedback';
                    }
                    else null;
                  },
                  onChanged: (v){
                    setState(() {
                      Feedback=v;
                    });
                  },
                  decoration: InputDecoration(
                      label: Text("Feedback"),
                      hintText: "Enter Feedback",
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
              Padding(
                padding: const EdgeInsets.all(70),
                child: SizedBox(

                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {

                      });
                    },style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button background color
                    foregroundColor: Colors.white,  // Text color
                    padding: EdgeInsets.symmetric(horizontal: 101, vertical: 15),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                  ),child: Text("Submit"),
                  ),),
              ),

            ],
          ),
        )
      ),);
  }
}
