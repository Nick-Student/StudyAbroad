import 'package:flutter/material.dart';

// The Item class will hold store the state information for the expansion panel.
class Item {
  Item(this.englishPhrase, this.romajiPhrase, this.japanesePhrase, this.isExpanded); // Constructor

  String englishPhrase; // The englishPhrase variable will hold the string for an English sentence.
  String romajiPhrase; // The romajiPhrase variable will hold the string for a romanized sentence.
  String japanesePhrase; // The japanesePhrase variable will hold the string for a Japanese sentence.
  bool isExpanded; // The isExpanded variable will determine the state of the panel for expansion and collapsion.
}

class Phrases extends StatefulWidget {
  @override
  _PhrasesState createState() => _PhrasesState();
}

class _PhrasesState extends State<Phrases> {

  // The _phrases list will contain all the phrases. If a phrase needs to be added or deleted, it can be done here.
  final List<Item> _phrases = [
    Item("Hello", "konnichiwa", "こんにちは", false),
    Item("Good Morning", "ohayou gozaimasu", "おはようございます", false),
    Item("Goodbye", "sayounara", "さようなら", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Helpful Phrases'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildPanel(),
        )
      )
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(

      // If the expand or collapse button is pressed, the panel's state will change to the opposite.
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _phrases[index].isExpanded = !isExpanded;
        });
      },

      // The panels will be built according to the item's variables.
      children: _phrases.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.englishPhrase), // The English phrase will be the main title for the users to see.
            );
          },

          // The romanized and Japanese phrases will only be visible when the panel is in its expanded state.
          body: ListTile(
            title: Text(item.romajiPhrase),
            subtitle: Text(item.japanesePhrase),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}