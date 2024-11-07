import 'dart:async';
import 'package:flutter/material.dart';
import 'package:system_clock/view/homepage.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Home_Page()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(
              "https://icons.iconarchive.com/icons/dtafalonso/android-lollipop/512/Clock-icon.png"),
        ),
      ),
    );
  }
}
