import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/side_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'dart:collection';

class GMap extends StatefulWidget {
  GMap({Key key}) : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller){
    _mapController = controller;
    setState(() {
      _markers.add(
          Marker(
              markerId: MarkerId("0"),
              position: LatLng(35.4512,139.6318),
              infoWindow: InfoWindow(
                title: 'Sakuragicho',
                snippet: 'A beautiful sea-side hotspot'
              )
        ),
      );
    });
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
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(35.2956,139.5805),
            zoom: 12,
          ),
          markers: _markers,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
          child: Text('Button goes here'),

          )
        ],
      ),
    );
  }
}