import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/side_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'dart:collection';

// Creates the GMap page
class GMap extends StatefulWidget {
  GMap({Key key}) : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}


// Extensions on the GMap that act inside the created page
class _GMapState extends State<GMap> {
  //Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;

  // Creation of the markers and markerId arrays
  Map<MarkerId, Marker> markers = {};
  List listMarkerIds = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      //drawer: SideDrawer(),
      body: Stack(children: <Widget>[
        GoogleMap(
          markers: Set.of(markers.values),
          onMapCreated:(GoogleMapController controller){
            _mapController = controller;

            // Bank of MarkerId's
            MarkerId markerId1 = MarkerId("1");
            MarkerId markerId2 = MarkerId("2");
            MarkerId markerId3 = MarkerId("3");
            MarkerId markerId4 = MarkerId("4");
            MarkerId markerId5 = MarkerId("5");
            MarkerId markerId6 = MarkerId("6");
            MarkerId markerId7 = MarkerId("7");
            MarkerId markerId8 = MarkerId("8");
            MarkerId markerId9 = MarkerId("9");
            MarkerId markerId10 = MarkerId("10");

            // Adding to the list of MarkerId's 1-10
            listMarkerIds.add(markerId1);
            listMarkerIds.add(markerId2);
            listMarkerIds.add(markerId3);
            listMarkerIds.add(markerId4);
            listMarkerIds.add(markerId5);
            listMarkerIds.add(markerId6);
            listMarkerIds.add(markerId7);
            listMarkerIds.add(markerId8);
            listMarkerIds.add(markerId9);
            listMarkerIds.add(markerId10);

            // This is the creation of each of the markers, the information provided
            // is fed to the Googlemaps controller to place the pins
            // by changing the latlang will change the position of the pin on the map
            Marker marker1=Marker(
            markerId: markerId1,
            position: LatLng(35.4512,139.6318),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueCyan),
            infoWindow: InfoWindow(
                onTap: (){},
            ));

            Marker marker2 = Marker(
            markerId: markerId2,
            position: LatLng(34.4512,139.6318),
            icon: BitmapDescriptor.defaultMarkerWithHue
              (BitmapDescriptor.hueGreen),
            );

            Marker marker3= Marker(
            markerId: markerId3,
            position: LatLng(35.4512,138.6318),
            infoWindow: InfoWindow(
                onTap: (){},
            ));

            Marker marker4= Marker(
                markerId: markerId4,
                position: LatLng(40.4512,138.6318),
                infoWindow: InfoWindow(
                    onTap: (){},
                ));

            Marker marker5= Marker(
                markerId: markerId5,
                position: LatLng(36.4512,138.6318),
                infoWindow: InfoWindow(
                    onTap: (){},
                ));

            Marker marker6= Marker(
                markerId: markerId6,
                position: LatLng(38.4512,132.6318),
                infoWindow: InfoWindow(
                    onTap: (){},
                ));

            Marker marker7= Marker(
                markerId: markerId7,
                position: LatLng(37.4512,128.6318),
                infoWindow: InfoWindow(
                    onTap: (){},
                ));

            Marker marker8= Marker(
                markerId: markerId8,
                position: LatLng(30.4512,138.6318),
                infoWindow: InfoWindow(
                    onTap: (){},
                ));

            Marker marker9= Marker(
                markerId: markerId9,
                position: LatLng(31.5512,132.6318),
                infoWindow: InfoWindow(
                    onTap: (){},
                ));

            Marker marker10= Marker(
                markerId: markerId10,
                position: LatLng(30.4512,128.6318),
                infoWindow: InfoWindow(
                    onTap: (){},
                ));

            // setState places the pins onto the map by making the program redraw the page
            // with the new information on it.
          setState(() {
            markers[markerId1] = marker1;
            markers[markerId2] = marker2;
            markers[markerId3] = marker3;
            markers[markerId4] = marker4;
            markers[markerId5] = marker5;
            markers[markerId6] = marker6;
            markers[markerId7] = marker7;
            markers[markerId8] = marker8;
            markers[markerId9] = marker9;
            markers[markerId10] = marker10;
          });},

          initialCameraPosition: CameraPosition(
            target: LatLng(35.2956,139.5805),
            zoom: 12,
          ),
         // markers: markers,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
          child: FloatingActionButton(
            onPressed: null,
            child:
              Icon(
                Icons.pin_drop,
                color: Colors.white,
              )
          ),

        )
      ],
      ),
    );
  }
}