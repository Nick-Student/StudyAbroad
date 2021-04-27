import 'package:flutter/material.dart';
import 'package:flutter_project/screens/currency.dart';
import 'package:flutter_project/screens/guidebook.dart';
import 'package:flutter_project/screens/home.dart';
import 'package:flutter_project/screens/map.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
import 'package:flutter_project/screens/schedule.dart';
import 'package:flutter_project/screens/announcements.dart';
import 'package:flutter_project/screens/phrases.dart';
import 'package:flutter_project/screens/photos.dart';
import 'package:flutter_project/screens/login.dart';
import 'package:flutter_project/screens/help.dart';
import 'package:flutter_project/services/auth.dart';
import 'package:flutter_project/services/register.dart';
import 'package:flutter_project/wrapper.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'services/database.dart';

// This is the action that launches the application.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: "Mavericks Abroad",
          debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          //platform: TargetPlatform.iOS,
        ),
        home: Wrapper(), // This is the initial page that is shown when launched
        routes: {
          // These routes are used to assign a page to the build context of the assigned name
          'home': (context) => Home(),
          'map': (context) => GMap(),
          'schedule': (context) => Scheduler(),
          'announcements': (context) => Announcements(),
          'phrases': (context) => Phrases(),
          'guidebook': (context) => Guidebook(),
          'photobook': (content) => Photobook(),
          'currency' : (context) => Currency(),
          'login': (context) => Login(),
          'register': (context) => Register(),
          'help': (context) => Help(),
        }
      ),
    );
  }
}