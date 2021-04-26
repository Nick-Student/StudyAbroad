import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/screens/map.dart';

final databaseReference = FirebaseDatabase.instance.reference();



DatabaseReference savePin(Pin pin) {
  var id = databaseReference.child('Pins/').push();
  id.set(pin.toJson());
  return id;
}

void updateMarkers(Pin pin, DatabaseReference id) {
  id.update(pin.toJson());
}

Future<List<Pin>> getPins() async {
  DataSnapshot dataSnapshot = await databaseReference.child('Pins/').once();
  List<Pin> pins = [];
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key,value) {
      Pin pin = createPin(value);
      pin.setId(databaseReference.child('Pins/' + key));
      pins.add(pin);
    });
  }
  return pins;
}