import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ViewModel/firstscreen.viewmodel.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Current Temperature",
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: Temp(),
      duration: 8000,
      splashIconSize: 550,
      splash: 'assets/logo.gif',
    );
  }
}


