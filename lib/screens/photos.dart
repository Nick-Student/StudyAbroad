// Photobase
//import 'package:flutter/cupertino.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
//import 'photoStorage.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Photobook extends StatefulWidget {
  @override
  _PhotobookState createState() => _PhotobookState();
}

class _PhotobookState extends State<Photobook> {

  Widget makeGrid(){
    return GridView.builder(
      itemCount: 12,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context,index) {
          return GridItem(index+1);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photobook', textAlign: TextAlign.center,),
      ),
      body: Container(
        child: makeGrid(),
      ),
    );
  }
}

class GridItem extends StatefulWidget {
  int _index;

  GridItem(int index){
    this._index = index;
  }

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  Uint8List imageFile;
  StorageReference photosReference = FirebaseStorage.instance.ref().child("test");

  getImage(){
    int MAX_SIZE = 7*1024*1024;
    photosReference.child('${widget._index}.jpg').getData(MAX_SIZE).then((data){
      this.setState(() {
        imageFile = data;
      });
    }).catchError((error){

    });
  }

  Widget decideGridTileWidget() {
    if(imageFile ==null){
      return Center(child: Text("No Data"));
    } else {
      return Image.memory(imageFile,fit: BoxFit.cover,);
    }
  }

  @override
  void initState(){
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(child: decideGridTileWidget());
  }
}

/*List<Pictures> _pictures = [
  Pictures(
    path: 'pictures/fuji_lake.jpg',
    photographer: 'Nick',
    title: 'Fuji Lake',
    details: 'A stunning view of Japans most prominent landmark.'
  ),
  Pictures(
      path: 'pictures/tori.jpg',
      photographer: ' Oda Nobunaga',
      title: 'Tori Gate on the Water',
      details: 'A serene scene set upon the water.'
  ),
  Pictures(
      path: 'pictures/bamboo.jpg',
      photographer: 'Nick',
      title: 'Bamboo Forest',
      details: 'A forest of powerful bamboo.'
  ),
  Pictures(
      path: 'pictures/gold_palace.jpg',
      photographer: 'Bryan',
      title: 'A palace of Gold',
      details: 'A kings ransom sitting on a lake.'
  ),
  Pictures(
      path: 'pictures/japan_streets.jpg',
      photographer: 'Sammy',
      title: 'Streets of Japan',
      details: 'The peaceful streets of Japan.'
  ),
];

class Photobook extends StatefulWidget {
  @override
  _PhotobookState createState() => _PhotobookState();
}

class _PhotobookState extends State<Photobook> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Photobook',
          textAlign: TextAlign.center,
        )
      ),
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              'Summer 2021',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1, 2),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ]
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => photoStorage(
                                path: _pictures[index].path,
                                title: _pictures[index].title,
                                photographer: _pictures[index].photographer,
                                details: _pictures[index].details,
                                index: index,
                              )
                          )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(_pictures[index].path),
                            fit: BoxFit.cover,
                            //),
                          ),
                         ),
                        ),
                    );
                  },
                 itemCount: _pictures.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Pictures {
  final String path;
  final String photographer;
  final String title;
  final String details;
  Pictures({
    @required this.path,
    @required this.photographer,
    @required this.title,
    @required this.details,
  });
} */