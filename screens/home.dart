import 'package:flutter/material.dart';
import 'map.dart';

class Home extends StatefulWidget {
  Home( { Key key, this.title}) : super(key: key);

  final String title;
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text(
                'In Development',
                style: TextStyle(fontSize: 42),
              ),
              SizedBox(height: 24),
              Text(
                'Imagine a super slick homepage for now',
                style: TextStyle(fontSize: 20),
              )
            ],
          )
        )
      ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Open the Map',
          child: Icon(Icons.map),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GMap()),
          ),
        ),
    );
  }
}