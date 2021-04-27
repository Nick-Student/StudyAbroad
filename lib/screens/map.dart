
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// Creates the GMap page
class GMap extends StatefulWidget {
  GMap({Key key}) : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}


// Extensions on the GMap that act inside the created page
class _GMapState extends State<GMap> {

  var clients = [];

  GoogleMapController mapController;

  // Creation of the markers and markerId arrays
  List<Marker> myMarker = <Marker>[];

  @override
  void initState() {
    super.initState();
    setState(() {
       populateClients();
    });

  }

  populateClients() {
    clients = [];
    myMarker.clear();
    Firestore.instance.collection('/map pins').getDocuments().then((docs) {
    if(docs.documents.isNotEmpty) {
      for(int i = 0;i< docs.documents.length; i++ ) {
       // print("looped");
        clients.add(docs.documents[i].data);
        initMarker(docs.documents[i].data, i);
      }
    }
  });
  } // end of populate clients

  initMarker(client,i) {
        myMarker.add(
          Marker(
              markerId: MarkerId(i.toString()),
              position: LatLng(
                  client['coord'].latitude, client['coord'].longitude),
              draggable: false,
              infoWindow: InfoWindow(
                  title: client['location'],
                  snippet: client['details']
              )


          )
        );
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
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(35.6762,139.6503),
            zoom: 10,
          ),
          markers: Set<Marker>.of(myMarker),
          onMapCreated: (GoogleMapController controller) {
           // _controller.complete(controller);
            setState(() {
              //populateClients();
            });
          },


         // markers: markers,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
          /*child: FloatingActionButton(
            onPressed: () {
              //Marker markerT = new Marker(35.2956, 139.5805, 'tokyo');
              //savePin(markerT);

            },
            child:
              Icon(
                Icons.pin_drop,
                color: Colors.white,
              )
          ),*/

        )
      ],
      ),
    );
  }
}