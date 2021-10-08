import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:currentemperature/ViewModel/firstscreen.model.dart';

const apiKey = 'fefeb933ca6d408784b392f965f43308';
var temp;
var cityName;
var windSpeed;
var humidity;
var countryCode;
var cloud;

Future<void> getData(setState) async{
  var _url = Uri.parse('https://api.weatherbit.io/v2.0/current?lat=$lat&lon=$lon&key=$apiKey');
  http.Response response = await  http.get(_url);
  if(response.statusCode == 200){
    String data = response.body;
    var decodedData = jsonDecode(data);
    print(decodedData);
    setState(() {
      cloud = decodedData['data'][0]['weather']['description'];
      countryCode = decodedData['data'][0]['country_code'];
      temp = decodedData['data'][0]['temp'];
      cityName = decodedData['data'][0]['city_name'];
      windSpeed = decodedData['data'][0]['wind_spd'].toStringAsFixed(0);
      humidity = decodedData['data'][0]['rh'].toStringAsFixed(0);
    }
    );
  }
  else{
    print(response.body);
  }
}
