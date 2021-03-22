import 'package:flutter/material.dart';
import 'package:flutter_project/screens/guidebook.dart';
import 'package:flutter_project/screens/home.dart';
import 'package:flutter_project/screens/map.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
import 'package:flutter_project/screens/schedule.dart';
import 'package:flutter_project/screens/phrases.dart';
import 'package:flutter_project/screens/photos.dart';

// This is the action that launches the application.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mavericks Abroad",
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: 'home', // This is the initial page that is shown when launched
      routes: {
        // These routes are used to assign a page to the build context of the assigned name
        'home': (context) => Home(),
        'map': (context) => GMap(),
        'schedule': (context) => Scheduler(),
        'phrases': (context) => Phrases(),
        'guidebook': (context) => Guidebook(),
        'photobook': (content) => Photobook(),
      }
    );
  }
}