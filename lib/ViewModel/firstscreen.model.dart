import 'package:currentemperature/View/firstscreen.view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:currentemperature/Controller/firstscreen.controller.dart';

var lon;
var lat;

class Temp extends StatefulWidget {
  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lon = position.longitude;
      lat = position.latitude;
      getData(setState);
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FirstScreenView();
  }
}