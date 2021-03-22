import 'package:flutter/material.dart';
import 'package:flutter_project/side_drawer.dart';
////import 'map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {

  int temperature;
  int tempF;
  String location = 'Tokyo';
  String announcement = 'We are meeting at the train-station at 9am.';
  int woeid = 1118370;  // initial where on earth ID for tokyo

  String weather = 'clear';
  String abbreviation = '';
  String errorMessage = '';

  String locationApiUrl = 'https://www.metaweather.com/api/location/';
  String searchApiUrl = 'https://www.metaweather.com/api/location/search/?query=';

  @override
  void initState() {
    super.initState();
    fetchLocation();
  }

  // Takes in the search results of user input location and provides
  // the location and woeid to be used.
  // Additionally this acts as our error handling, if the API doesn't support
  // the location searched it will give an error, and erase the error on a
  // valid input.
  void fetchSearch(String input) async {
    try {
      var searchResult = await http.get(searchApiUrl + input);
      var result = json.decode(searchResult.body)[0];

      setState(() {
        location = result["title"];
        woeid = result["woeid"];
        errorMessage = '';
      });
    }
    catch(error){
      setState(() {
        errorMessage = "This city either does not exist or is not supported at this time.";
      });
    }
  } // end fetchSearch

  // This function calls the weather API and sets values
  // this lets us use the temperature, weather type and icon
  void fetchLocation() async {
    var locationResult = await http.get(locationApiUrl + woeid.toString());
    var result = json.decode(locationResult.body);
    var consolidated_weather = result["consolidated_weather"];
    var data = consolidated_weather[0];

    setState(() {
      temperature = data["the_temp"].round();
      tempF = ((temperature * 1.8)+32).round();
      weather = data["weather_state_name"].replaceAll(' ','').toLowerCase();
      abbreviation = data["weather_state_abbr"];
    });
  }   // end fetchLocation

  // This pulls the information once the city is entered and asynchronously
  // updates the application. This solved the error where enter would need to
  // be hit multiple times.
  void onTextFieldSubmitted(String input) async{
    await fetchSearch(input);
    await fetchLocation();
  } // end onTextFieldSubmitted


  @override
  Widget build(BuildContext context) {
    return temperature == null ? Center(child:CircularProgressIndicator()) :
    Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: Text('Mavericks Abroad')),
      drawer: SideDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/$weather.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        heightFactor: 1.9999,
                        child: Image.network(
                            'https://www.metaweather.com/static/img/weather/png/'+abbreviation+'.png',
                          width: 100,
                        )
                      ),

                    Center(
                      child: Text(
                        tempF.toString() + ' °F',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 60.0,
                            height: 0,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      location,
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 300,
                    child: TextField(
                      onSubmitted: (String input){
                        onTextFieldSubmitted(input);
                      },
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      decoration: InputDecoration(
                        hintText: 'Search another location...',
                        hintStyle:
                        TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ]
                        ),
                        prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 350,
                        child: Text(
                            errorMessage,
                            softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: Platform.isAndroid? 18.0: 20.0,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ]
                          )
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 350,
                    child:Center(
                      child: Text(
                      announcement,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          shadows: <Shadow>[
                          Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ]
                        )
                      )
                    )
                  )
                ]
              )
                ],
          ),
          ),
        );
  }
}