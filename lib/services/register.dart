import 'package:flutter/material.dart';
import 'package:flutter_project/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String email = '';
  String password = '';

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            titleSpacing: 65,
            title: Text(
                'Register for Mavericks Abroad',
                textAlign: TextAlign.center
            )
        ),
        backgroundColor: Colors.deepOrange[100],
        body:Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 154,
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
                            onChanged: (val){
                              //setState(() => email = val);
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
                            obscureText: true,
                            onChanged: (val) {
                              //setState(() => password = val);
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
                            obscureText: true,
                            onChanged: (val) {
                              //setState(() => password = val);
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
                              //print(email);
                              //print(password);
                            },
                            padding: EdgeInsets.symmetric(vertical: 15,),
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
        )
    );
  }
}
