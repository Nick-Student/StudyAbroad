import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'file:///C:/Users/19407/AndroidStudioProjects/flutter_project/lib/screens/map.dart';
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
      home: Home(title: 'Mavericks Abroad'),
    );
  }
}