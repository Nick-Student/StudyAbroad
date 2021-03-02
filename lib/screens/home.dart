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
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text('Mavericks Abroad')),
      drawer: SideDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                //'https://github.com/mercihohmann/flutter-weather-app-starterkit/blob/master/weather_app/images/heavyrain.png?raw=true'
                //'https://github.com/mercihohmann/flutter-weather-app-starterkit/blob/master/weather_app/images/thunderstorm.png?raw=true'
                //'https://github.com/mercihohmann/flutter-weather-app-starterkit/blob/master/weather_app/images/clear.png?raw=true'
                //'https://github.com/mercihohmann/flutter-weather-app-starterkit/blob/master/weather_app/images/lightcloud.png?raw=true'
                'https://s1.1zoom.me/b5373/148/Japan_Winter_Roads_Shirakawa-go_and_Gokayama_Snow_561175_1080x1920.jpg'
                ////////'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU7giuE81IEhjIJlGiVAPNeOuL9VC52gZalQ&usqp=CAU'
                //'https://wallpaperaccess.com/full/691908.jpg'
                //'https://lh3.googleusercontent.com/proxy/CvnjPSBPdZ9rQrs5Fru9IpbxqmHSBxA2yxKTuafQU0Novk33nfL_eOLvU6jP4cit5RPBs-HA81JvDvyG-oHh6tXJ2Jnbqb1EoRN_GvNBf8GvM8dJwP7e-qM=s0-d'


            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Text(
                  'Weather Information Displayed here.',
                style: TextStyle(fontSize: 24,color: Colors.deepPurple[700], backgroundColor: Colors.blueGrey),


              ),
              Text(
                'Picture will update based on forecast.',
                style: TextStyle(fontSize: 16,color: Colors.deepPurple[700], backgroundColor: Colors.blueGrey),
              ),
              Text(
                'We are meeting at the park today!!!!',
                style: TextStyle(fontSize: 20, color: Colors.black, height: 32,backgroundColor: Colors.blueGrey)
              )
            ],),
        ),
      ),
    );
  }
}