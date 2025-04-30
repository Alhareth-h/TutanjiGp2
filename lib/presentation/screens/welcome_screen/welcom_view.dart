import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp2/presentation/screens/welcome_screen/welcom_content.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeContent(),
    );
  }
}
