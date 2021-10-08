// import 'package:currentemperature/design.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:meta/meta.dart';
// import 'package:http/http.dart' as http;
// import 'package:currentemperature/ViewModel/firstscreen.model.dart';
// import 'dart:convert';
//
// const apiKey = 'fefeb933ca6d408784b392f965f43308';
// var lon;
// var lat;
//
// Future<Data> fetchData() async {
//     //var _url;
//     http.Response response = await  http.get(Uri.parse('https://api.weatherbit.io/v2.0/current?lat=$lat&lon=$lon&key=$apiKey'));
//   if (response.statusCode == 200) {
//     print(response.body);
//     return Data.fromJson(jsonDecode(response.body));
//   } else{
//       print(response.body);
//       return Data.fromJson(jsonDecode(response.body));
//     }
// }
//
// class Data {
//   Data({
//     @required this.lon,
//     @required this.countryCode,
//     @required this.clouds,
//     @required this.stateCode,
//     @required this.cityName,
//     @required this.windSpd,
//     @required this.lat,
//     @required this.temp,
//     @required this.appTemp,
//   });
//
//    double? lon;
//    String? countryCode;
//    int? clouds;
//    String? stateCode;
//    String? cityName;
//    String? windSpd;
//    double? lat;
//    String? temp;
//    String? appTemp;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     lon: json["lon"],
//     countryCode: json["country_code"],
//     clouds: json["clouds"],
//     stateCode: json["state_code"],
//     cityName: json["city_name"],
//     windSpd: json["wind_spd"],
//     lat: json["lat"],
//     temp: json["temp"],
//     appTemp: json["app_temp"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "lon": lon,
//     "country_code": countryCode,
//     "clouds": clouds,
//     "state_code": stateCode,
//     "city_name": cityName,
//     "wind_spd": windSpd,
//     "lat": lat,
//     "temp": temp,
//     "app_temp": appTemp,
//   };
// }
//
// Future<void> getLocation() async {
//   try {
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//     lon = position.longitude;
//     lat = position.latitude;
//     print(lat);
//     print(lon);
//   }
//   catch(e){
//     print(e);
//   }
// }
//
// class FirstScreenView extends StatefulWidget {
//   @override
//   _FirstScreenViewState createState() => _FirstScreenViewState();
// }
//
// class _FirstScreenViewState extends State<FirstScreenView> {
//   late Future<Data> futureData;
//
//
//   @override
//   void initState() {
//     super.initState();
//     getLocation();
//     setState(() {
//       futureData = fetchData();
//     });
//     // setState{(
//     // futureData = fetchData();)
//     // };
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Data>(
//         future: futureData,
//         builder: (context,snapshot){
//           if(snapshot.hasData){
//             print(snapshot.data);
//             return Scaffold(
//                 appBar: AppBar(
//                   centerTitle: true,
//                   elevation: 0,
//                   backgroundColor: Color(0xFFe6ebf2),
//                   title: Text(
//                     snapshot.data!.cityName.toString(),
//                     style: TextStyle(
//                       color: Colors.black.withOpacity(.6),
//                       letterSpacing: 2,
//                       fontSize: 30.0,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: "nunito",
//                     ),
//                   ),
//                 ),
//                 backgroundColor: Color(0xFFe6ebf2),
//                 body: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 25.0),
//                   child: SafeArea(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         // SizedBox(
//                         //   height: MediaQuery.of(context).viewPadding.top + 10,
//                         // ),
//                         SizedBox(
//                           height: 10.0,
//                         ),
//                         Container(
//                           height: 250,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               color: Color(0xFFe6ebf2),
//                               shape: BoxShape.circle,
//                               boxShadow: [
//                                 BoxShadow(
//                                     offset: Offset(-3, -3),
//                                     blurRadius: 3.0,
//                                     color: Colors.white.withOpacity(.7)),
//                                 BoxShadow(
//                                     offset: Offset(3, 3),
//                                     blurRadius: 3.0,
//                                     color: Colors.black.withOpacity(.15))
//                               ]),
//                           child: Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle, color: Color(0xFFe6ebf2)),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       color: Color(0xFFe6ebf2),
//                                       shape: BoxShape.circle,
//                                       boxShadow: [
//                                         BoxShadow(
//                                             offset: Offset(-2, -2),
//                                             blurRadius: 2.0,
//                                             color: Colors.black.withOpacity(.3)),
//                                         BoxShadow(
//                                             offset: Offset(2, 2),
//                                             blurRadius: 2.0,
//                                             color: Colors.white.withOpacity(.7)),
//                                       ]),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           color: Color(0xFFe6ebf2),
//                                           shape: BoxShape.circle),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(3.0),
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               color: Color(0xFFDCE7F1),
//                                               shape: BoxShape.circle,
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                     offset: Offset(-2, -2),
//                                                     blurRadius: 2.0,
//                                                     color: Colors.black.withOpacity(.3)),
//                                                 BoxShadow(
//                                                     offset: Offset(2, 2),
//                                                     blurRadius: 2.0,
//                                                     color: Colors.white.withOpacity(.7)),
//                                               ]),
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: <Widget>[
//                                               Text(
//                                                 "Feels Like",
//                                                 style: TextStyle(
//                                                     color: Colors.black.withOpacity(.6),
//                                                     fontFamily: "nunito",
//                                                     fontSize: 20.0),
//                                               ),
//                                               SizedBox(
//                                                 height: 10.0,
//                                               ),
//                                               Text(
//                                                 snapshot.data!.temp.toString(),
//                                                 style: TextStyle(
//                                                     color: Colors.black.withOpacity(.6),
//                                                     fontFamily: "nunito",
//                                                     fontWeight: FontWeight.bold,
//                                                     fontSize: 25.0),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10.0,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10.0, vertical: 10.0),
//                           child: Container(
//                               height: 90.0,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                   color: Color(0xFFe6ebf2),
//                                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         blurRadius: 5.0,
//                                         offset: Offset(-3, -3),
//                                         color: Colors.white.withOpacity(.7)),
//                                     BoxShadow(
//                                         blurRadius: 5.0,
//                                         offset: Offset(3, 3),
//                                         color: Colors.black.withOpacity(.15))
//                                   ]),
//                               child: Container(
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: <Widget>[
//                                     Padding(
//                                       padding:
//                                       const EdgeInsets.symmetric(horizontal: 20.0),
//                                       child: Container(
//                                         height: 55,
//                                         width: 55,
//                                         decoration: BoxDecoration(
//                                             color: Color(0xFFe6ebf2),
//                                             borderRadius:
//                                             BorderRadius.all(Radius.circular(20.0)),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   blurRadius: 5.0,
//                                                   offset: Offset(-3, -3),
//                                                   color: Colors.white.withOpacity(.7)),
//                                               BoxShadow(
//                                                   blurRadius: 5.0,
//                                                   offset: Offset(3, 3),
//                                                   color: Colors.black.withOpacity(.15))
//                                             ]),
//                                         child: Icon(
//                                           Icons.wb_sunny,
//                                           color: Colors.black.withOpacity(.5),
//                                           size: 30.0,
//                                         ),
//                                       ),
//                                     ),
//                                     Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         Text("Humidity",
//                                             style: TextStyle(
//                                                 fontFamily: "nunito",
//                                                 color: Colors.black.withOpacity(.5),
//                                                 fontSize: 15.0)),
//                                         Text("humidity %",
//                                             style: TextStyle(
//                                                 fontFamily: "nunito",
//                                                 color: Colors.black.withOpacity(.5),
//                                                 fontSize: 15.0))
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10.0, vertical: 10.0),
//                           child: Container(
//                               height: 90.0,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                   color: Color(0xFFe6ebf2),
//                                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         blurRadius: 5.0,
//                                         offset: Offset(-3, -3),
//                                         color: Colors.white.withOpacity(.7)),
//                                     BoxShadow(
//                                         blurRadius: 5.0,
//                                         offset: Offset(3, 3),
//                                         color: Colors.black.withOpacity(.15))
//                                   ]),
//                               child: Container(
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: <Widget>[
//                                     Padding(
//                                       padding:
//                                       const EdgeInsets.symmetric(horizontal: 20.0),
//                                       child: Container(
//                                         height: 55,
//                                         width: 55,
//                                         decoration: BoxDecoration(
//                                             color: Color(0xFFe6ebf2),
//                                             borderRadius:
//                                             BorderRadius.all(Radius.circular(20.0)),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   blurRadius: 5.0,
//                                                   offset: Offset(-3, -3),
//                                                   color: Colors.white.withOpacity(.7)),
//                                               BoxShadow(
//                                                   blurRadius: 5.0,
//                                                   offset: Offset(3, 3),
//                                                   color: Colors.black.withOpacity(.15))
//                                             ]),
//                                         child: Icon(
//                                           CupertinoIcons.wind_snow,
//                                           color: Colors.black.withOpacity(.5),
//                                           size: 30.0,
//                                         ),
//                                       ),
//                                     ),
//                                     Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         Text("Wind Speed",
//                                             style: TextStyle(
//                                                 color: Colors.black.withOpacity(.5),
//                                                 fontFamily: "nunito",
//                                                 fontSize: 15.0)),
//                                         Text(snapshot.data!.windSpd.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black.withOpacity(.5),
//                                                 fontFamily: "nunito",
//                                                 fontSize: 15.0))
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )),
//                         ),
//                         SizedBox(
//                           height: 5.0,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10.0, vertical: 10.0),
//                           child: Container(
//                               height: 90.0,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                   color: Color(0xFFe6ebf2),
//                                   borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         blurRadius: 5.0,
//                                         offset: Offset(-3, -3),
//                                         color: Colors.white.withOpacity(.7)),
//                                     BoxShadow(
//                                         blurRadius: 5.0,
//                                         offset: Offset(3, 3),
//                                         color: Colors.black.withOpacity(.15))
//                                   ]),
//                               child: Container(
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: <Widget>[
//                                     Padding(
//                                       padding:
//                                       const EdgeInsets.symmetric(horizontal: 20.0),
//                                       child: Container(
//                                         height: 55,
//                                         width: 55,
//                                         decoration: BoxDecoration(
//                                             color: Color(0xFFe6ebf2),
//                                             borderRadius:
//                                             BorderRadius.all(Radius.circular(20.0)),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   blurRadius: 5.0,
//                                                   offset: Offset(-3, -3),
//                                                   color: Colors.white.withOpacity(.7)),
//                                               BoxShadow(
//                                                   blurRadius: 5.0,
//                                                   offset: Offset(3, 3),
//                                                   color: Colors.black.withOpacity(.15))
//                                             ]),
//                                         child: Icon(
//                                           CupertinoIcons.cloud_moon_rain_fill,
//                                           color: Colors.black.withOpacity(.5),
//                                           size: 30.0,
//                                         ),
//                                       ),
//                                     ),
//                                     Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         Text("Cloud Outside",
//                                             style: TextStyle(
//                                                 color: Colors.black.withOpacity(.5),
//                                                 fontFamily: "nunito",
//                                                 fontSize: 15.0)),
//                                         Text(snapshot.data!.clouds.toString(),
//                                             style: TextStyle(
//                                                 color: Colors.black.withOpacity(.5),
//                                                 fontFamily: "nunito",
//                                                 fontSize: 15.0))
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Expanded(
//                           flex: 1,
//                           child: BottomAppBar(
//                             elevation: 0,
//                             color: Color(0xFFe6ebf2),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                               child: Container(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Design(
//                                       height1: 55,
//                                       width1: 55,
//                                       color: Color(0xFFe6ebf2),
//                                       offsetB: Offset(-2, -2),
//                                       offsetW: Offset(2, 2),
//                                       bLevel: 3.0,
//                                       iconData: CupertinoIcons.bolt_fill,
//                                       iconSize: 30.0,
//                                     ),
//                                     Design(
//                                       height1: 55,
//                                       width1: 55,
//                                       color: Color(0xFFe6ebf2),
//                                       offsetB: Offset(-2, -2),
//                                       offsetW: Offset(2, 2),
//                                       bLevel: 5.0,
//                                       iconData: CupertinoIcons.thermometer_snowflake,
//                                       iconSize: 30.0,
//                                     ),
//                                     Design(
//                                       height1: 55,
//                                       width1: 55,
//                                       color: Color(0xFFe6ebf2),
//                                       offsetB: Offset(-2, -2),
//                                       offsetW: Offset(2, 2),
//                                       bLevel: 5.0,
//                                       iconData: CupertinoIcons.snow,
//                                       iconSize: 30.0,
//                                     ),
//                                     Design(
//                                       height1: 55,
//                                       width1: 55,
//                                       color: Color(0xFFe6ebf2),
//                                       offsetB: Offset(-2, -2),
//                                       offsetW: Offset(2, 2),
//                                       bLevel: 5.0,
//                                       iconData: CupertinoIcons.sun_haze_fill,
//                                       iconSize: 30.0,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//             );
//           }
//           else if (snapshot.hasError) {
//             return Text('${snapshot.error}');
//           }
//           return Center(child: const CircularProgressIndicator());
//     },
//           );
//   }
// }
//
//
