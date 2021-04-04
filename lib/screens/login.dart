// This is the page that handles login

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home.dart';

class Login extends StatefulWidget {

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login>{
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Mavericks Abroad', textAlign: TextAlign.center)),
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://utamavs.com/images/logos/site/site.png'
                  ),
                 // fit: BoxFit.cover,
                )
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 22,
                    ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    decoration: InputDecoration(
                      hintText: 'Enter your username',
                      hintStyle:
                      TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18.0,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ]
                      ),
                   )
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                Container(
                  width: 300,
                  child: TextField(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle:
                        TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18.0,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ]
                        ),
                      )
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        'home',
                      );
                    },
                    //padding: EdgeInsets.fromLTRB(30, 5, 0,0),
                    //color: Colors.blueGrey,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}