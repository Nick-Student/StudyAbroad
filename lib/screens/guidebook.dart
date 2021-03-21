import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class Guidebook extends StatefulWidget {
  @override
  _GuidebookState createState() => _GuidebookState();
}

class _GuidebookState extends State<Guidebook> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  // The loadDocument function will get the PDF file from the assets folder.
  loadDocument() async {
    document = document = await PDFDocument.fromAsset('assets/guide.pdf');

    setState(() => _isLoading = false);
  }

  // The PDF file will be displayed using the pre-built PDF viewer.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guide'),
      ),
      body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: document)),
    );
  }
}