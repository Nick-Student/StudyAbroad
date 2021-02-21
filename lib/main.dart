import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_project/screens/map.dart';
//import 'package:location/location.dart';
import 'package:flutter_project/screens/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mavericks Abroad",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => Home(),
        'map': (context) => GMap(),
      }
    );
  }
}