import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

// The Item class will hold store the state information for the expansion panel.
class Item {
  Item(this.englishPhrase, this.romajiPhrase, this.japanesePhrase, this.audioFile, this.isExpanded); // Constructor

  String englishPhrase; // The englishPhrase variable will hold the string for an English sentence.
  String romajiPhrase; // The romajiPhrase variable will hold the string for a romanized sentence.
  String japanesePhrase; // The japanesePhrase variable will hold the string for a Japanese sentence.
  String audioFile; // The audioFile variable will hold the string for the file name of the audio file.
  bool isExpanded; // The isExpanded variable will determine the state of the panel for expansion and collapsion.
}

class Phrases extends StatefulWidget {
  @override
  _PhrasesState createState() => _PhrasesState();
}

class _PhrasesState extends State<Phrases> {
  AudioCache _audioCache;

  // The _phrases list will contain all the phrases. If a phrase needs to be added or deleted, it can be done here.
  final List<Item> _phrases = [
    Item("Hello / Good Afternoon", "konnichiwa", "こんにちは", "hello.mp3", false),
    Item("Good Morning", "ohayou gozaimasu", "おはようございます", "morning.mp3", false),
    Item("Good Evening", "konbanwa", "こんばんは", "evening.mp3", false),
    Item("Goodbye", "sayounara", "さようなら", "goodbye.mp3", false),
    Item("Please", "onegai shimasu", "おねがいします", "please.mp3", false),
    Item("Thank you","arigatou gozaimasu", "ありがとうございます", "thanks.mp3", false),
    Item("You're welcome","dou itashimashite", "どういたしまして", "welcome.mp3", false),
    Item("Excuse me / Sorry","sumimasen", "すみません", "sorry.mp3", false),
    Item("Are you okay?", "daijyoubu desu ka?", "だいじょうぶ ですか？", "okay.mp3", false),
    Item("Yes","hai", "はい", "yes.mp3", false),
    Item("No","iie", "いいえ", "no.mp3", false),
    Item("I don't understand","wakarimasen", "わかりません", "understand.mp3", false),
    Item("Can you help me?","tasukete moraemasuka?", "たすけて もらえますか？", "help.mp3", false),
    Item("Where is (_____)?","(_____) wa doko desu ka?", "(_____)はどこですか？", "where.mp3", false),
    Item("I want to go to (_____)","(_____) ni ikitai desu", "(_____)に いきたいです", "togo.mp3",   false),
    Item("Toilet", "toire", "トイレ", "toilet.mp3", false),
    Item("This hotel", "kono hoteru", "この ほてる", "hotel.mp3", false),
    Item("The train station", "denshya no eki", "でんしゃの えき", "train.mp3", false),
    Item("The bus station", "basutei", "ばすてい", "bus.mp3", false),
    Item("Take me to this address, please","kono jyuushyo made tsureteitte kudasai", "この じゅうしょ まで つれていってください", "address.mp3", false),
    Item("How much does this cost?","kore wa ikura desu ka?", "これは いくらですか？", "cost.mp3", false),
    Item("I would like this","kore o onegai shimasu", "これを おねがいします", "want.mp3", false),
  ];

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(prefix: "audio/"); // The file will be fetched from the local audio folder.
  }

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
            trailing: ElevatedButton(
              onPressed: () => _audioCache.play(item.audioFile), // The audio file will play when the button is pressed.
              child: Icon(
                Icons.volume_up_rounded,
                color:Colors.lightBlue,
              ),
            )
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}