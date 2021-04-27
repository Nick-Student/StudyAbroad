import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home.dart';
import 'package:flutter_project/services/auth.dart';


class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String email = '';
  String password = '';
  String verifyPass = '';
  String error = '';

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            FlatButton.icon(
              onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
              icon: Icon(
                    Icons.person
                ),
              label: Text('Back'),
            )
          ],
            titleSpacing: 20,
            title: Text(
                'Register for Mavericks Abroad',
                textAlign: TextAlign.center
            )
        ),
        backgroundColor: Colors.brown[100],
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
                        SizedBox(width: 20,),
                        Text(
                          'Email: ',
                          style: TextStyle(
                            fontSize: 18,
                            height: 2,
                          ),
                        ),
                        Container(
                          width: 300,
                          child: TextFormField(
                              validator: (val) => val.isEmpty ? 'Enter an email' : null,
                              onChanged: (val){
                                setState(() => email = val);
                              },
                              style: TextStyle(color: Colors.black, fontSize: 25),
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
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
                            fontSize: 18,
                            height: 2,
                          ),
                        ),
                        Container(
                          width: 300,
                          child: TextFormField(
                              validator: (val) => val.length < 6 ? 'Enter a password with 6 or more characters' : null,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Password: ',
                          style: TextStyle(
                            color: Colors.pink,
                            fontSize: 18,
                            height: 2,
                          ),
                        ),
                        Container(
                          width: 300,
                          child: TextFormField(
                              validator: (val) => val.compareTo(password) != 0 ? "Your passwords do not match" : null,
                              obscureText: true,
                              onChanged: (val) {
                                setState(() => verifyPass = val);
                              },
                              style: TextStyle(color: Colors.black, fontSize: 24),
                              decoration: InputDecoration(
                                hintText: 'Enter your password again',
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
                                  dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                  //dynamic result1 = await _auth.signInWithEmailAndPassword(email, password);
                                  if (result == null){
                                    setState(() => error = 'There was an error when attempting to make your profile');
                                    print(error);
                                  }
                                  Navigator.pushReplacementNamed(context, 'login');
                                }
                              },
                              padding: EdgeInsets.symmetric(vertical: 10,),
                              color: Colors.green,
                              child: Text(
                                'Register',
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
                      height: 60,
                        ),
                      ],
                )
                  ],


            ),
          ),
        )
    );
  }
}
