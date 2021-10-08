import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ViewModel/firstscreen.model.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';

void main() async=> {
  WidgetsFlutterBinding.ensureInitialized(),
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp],
   ),
  runApp(MyApp())
};

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


