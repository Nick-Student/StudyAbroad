import 'package:flutter/material.dart';
import 'package:flutter_project/side_drawer.dart';
import 'map.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Mavericks Abroad')),
      drawer: SideDrawer(),
      body: Column(children: <Widget> [
        Align(
          alignment: Alignment.topCenter,
          child: Image(
            height: 400,
            width: 350,
            image: NetworkImage(
                'https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/02/a0002487/img/basic/a0002487_main.jpg?20201116111704&q=80&rw=750&rh=536'
            )
          )
        ),
        Text(
            'Weather Information Displayed here.',
          style: TextStyle(fontSize: 24)
        ),
        Text(
          'Picture will update based on forecast.'
        )

        
      ],),

        // floatingActionButton: FloatingActionButton(
        //   tooltip: 'Open the Map',
        //   child: Icon(Icons.map),
        //   onPressed: () => Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => GMap()),
        //   ),
        // ),
    );
  }
}