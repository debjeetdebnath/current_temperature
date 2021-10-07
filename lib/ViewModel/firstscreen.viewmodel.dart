import 'package:connectivity/connectivity.dart';
import 'package:currentemperature/View/firstscreen.view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const apiKey = 'fefeb933ca6d408784b392f965f43308';
var temp;
var cityName;
var windSpeed;
var humidity;
var countryCode;
var cloud;
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
      //connectivity();
      getData();
    }
    catch(e){
      print(e);
    }
  }

  Future<void> getData() async{
    var _url = Uri.parse('https://api.weatherbit.io/v2.0/current?lat=$lat&lon=$lon&key=$apiKey');
    http.Response response = await  http.get(_url);
    if(response.statusCode == 200){
      String data = response.body;
      var decodedData = jsonDecode(data);
      setState(() {
        cloud = decodedData['data'][0]['weather']['description'];
        countryCode = decodedData['data'][0]['country_code'];
        temp = decodedData['data'][0]['temp'];
        cityName = decodedData['data'][0]['city_name'];
        windSpeed = decodedData['data'][0]['wind_spd'].toStringAsFixed(0);
        humidity = decodedData['data'][0]['rh'].toStringAsFixed(0);
      });
    }
    else{
      print(response.body);
    }
  }

  //Future<void> connectivity() async{
  //   var connectivityResult = await(Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi)
  //   {
  //     print('connected');
  //     getLocation();
  //   } else if (connectivityResult == ConnectivityResult.none) {
  //     print('not connected');
  //     getLocation();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return FirstScreenView();
  }
}
