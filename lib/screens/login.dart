// This is the page that handles login

//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home.dart';
import 'package:flutter_project/services/auth.dart';
import 'package:flutter_project/models/user.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login>{


  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // text field state

  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 120,
          title: Text(
            'Mavericks Abroad',
            textAlign: TextAlign.center,
          )
      ),
      backgroundColor: Colors.deepOrange[100],
      body:Container(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: 114,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(
                              'https://utamavs.com/images/logos/site/site.png'),
                          // fit: BoxFit.cover,
                        ))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Login: ',
                          style: TextStyle(
                            fontSize: 25,
                            height: 2,
                          ),
                        ),
                        Container(
                          width: 300,
                          child: TextFormField(
                              validator: (val) => val.isEmpty ? 'Enter your email' : null,
                              onChanged: (val){
                                setState(() => email = val);
                              },
                              style: TextStyle(color: Colors.black, fontSize: 25),
                              decoration: InputDecoration(
                                hintText: 'Enter your username',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.0,
                                ),
                              )),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Password: ',
                          style: TextStyle(
                            fontSize: 22,
                            height: 2,
                          ),
                        ),
                        Container(
                          width: 300,
                          child: TextFormField(
                              validator: (val) => val.isEmpty ? 'Enter your password' : null,
                              obscureText: true,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                              style: TextStyle(color: Colors.black, fontSize: 24),
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.0,
                                ),
                              )),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height:10
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                               RaisedButton(
                                onPressed: () async {
                                if (_formKey.currentState.validate()){
                                    print('valid');
                                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                    if (result == null){
                                       setState(() => error = 'Failed to sign in with given credentials');
                                    }
                                  }
                                },
                                padding: EdgeInsets.symmetric(vertical: 20),
                                color: Colors.green,
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          'register',
                        );
                      },
                        child: Text(
                          'Make an Account'
                        ),
                        color: Colors.blueGrey,
                      ),
                      RaisedButton(
                          onPressed: () async {
                            dynamic result = await _auth.signInAnon();
                            if (result == null) {
                              print('error signing in');
                            }else {
                              print('signed in');
                              print('anonymous user ' + result.uid);
                            }
                            Navigator.pushReplacementNamed(
                              context,
                              'home',
                            );
                          },
                          child: Text(
                              'Sign in Anonymously'
                          ),
                        color: Colors.blueGrey,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        )
    );
  }
}
