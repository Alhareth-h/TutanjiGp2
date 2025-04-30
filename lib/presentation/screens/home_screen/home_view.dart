import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp2/presentation/screens/home_screen/home_content.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(title: Text("Farmer"),centerTitle: true,),
      body: HomeContent()
    );
  }
}
