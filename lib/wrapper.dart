import 'package:flutter_project/screens/home.dart';
import 'screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
import 'package:flutter/material.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    final user = Provider.of<User>(context);
    print(user);
    // return either home or login screen depending on it the user is logged in
    // already or not
    if (user == null) {
      return Login();
    } else{
      return Home();
    }
  }
}