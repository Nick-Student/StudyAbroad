import 'package:flutter/material.dart';

class Phrases extends StatefulWidget {

  @override
  _PhrasesState createState() => _PhrasesState();
}

class _PhrasesState extends State<Phrases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Helpful Phrases'),
        ),
        body: ListView(
            children: [
              ListTile(
                title: const Text('konnichiwa'),
                subtitle: Text(
                  'こんにちは',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Hello',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
              ),
              ListTile(
                title: const Text('ohayou gozaimasu'),
                subtitle: Text(
                  'おはようございます',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Good Morning',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
              ),
              ListTile(
                title: const Text('sayounara'),
                subtitle: Text(
                  'さようなら',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Goodbye',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
            ]
        )
    );
  }
}