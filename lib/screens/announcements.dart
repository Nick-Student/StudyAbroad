import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Announcements extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcements> {



  Future getAnnouncements() async {
    var firestore = Firestore.instance;
    QuerySnapshot announce = await firestore.collection("announcements").getDocuments();
    return announce.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements')),
      body: FutureBuilder(
          future: getAnnouncements(),
          builder: (_, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
                return ListView.separated(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(snapshot.data[snapshot.data.length - index - 1].data["text"]),
                    );
                },
                separatorBuilder: (_, index) {
                    return Divider(
                      color: Colors.black,
                      thickness: 1
                    );
                });
              }
          }),

    );
  }
}