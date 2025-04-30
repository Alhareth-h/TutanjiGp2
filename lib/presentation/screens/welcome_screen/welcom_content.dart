import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp2/presentation/screens/login_screen/login_view.dart';
import 'package:gp2/presentation/screens/register_screen/register_view.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            SizedBox(
                height: 350,
                width: 300,
                child: Image.asset("assets/images/img.png")),
            SizedBox(
              height: 40,
              width: 40,
            ),
            Text(
              " Welcome to TORBETNAH Thank you for trust us. ",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 40,
              width: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  // Button background color
                  foregroundColor: Colors.white,
                  // Text color
                  padding:
                  EdgeInsets.symmetric(horizontal: 101, vertical: 15),
                  textStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: Text("SignIn")),
            SizedBox(
              height: 30,
              width: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterView()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  // Button background color
                  foregroundColor: Colors.white,
                  // Text color
                  padding: EdgeInsets.symmetric(horizontal: 67, vertical: 15),
                  textStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: Text("Create account")),
          ],
        ),
      ),
    );
  }
}
