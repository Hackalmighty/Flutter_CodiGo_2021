import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  AudioCache audioCache = AudioCache();

  void playSound(int number) {
    audioCache.play('audios/note$number.wav');
  }

  Widget buildKey({Color color, int number}){
    return Expanded(
      child: FlatButton(
        child: Text("key $number"),
        color: color,
        onPressed: () {
          playSound(number);
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Xylophone"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(color: Color(0xff43a047),number: 1),
            buildKey(color: Color(0xff4caf50),number: 2),
            buildKey(color: Color(0xff66bb6a),number: 3),
            buildKey(color: Color(0xff81c784),number: 4),
            buildKey(color: Color(0xffa5d6a7),number: 5),
            buildKey(color: Color(0xffc8e6c9),number: 6),
            buildKey(color: Color(0xffe8f5e9),number: 7),
          ],
        ),
      ),
    );
  }
}
