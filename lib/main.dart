import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Xylophone(title: 'Xylophone'),
    );
  }
}

class Xylophone extends StatefulWidget {
  Xylophone({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final player = AudioCache();

  void playSound(int soundNumber) {
    player.play("note$soundNumber.wav");
  }

  Expanded getKey({Color colorName, int soundNumber}) {
    return Expanded(
      child: TextButton(
        onPressed: () => playSound(soundNumber),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(colorName)
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getKey(colorName: Colors.blue, soundNumber: 1),
            getKey(colorName: Colors.red, soundNumber: 2),
            getKey(colorName: Colors.yellow, soundNumber: 3),
            getKey(colorName: Colors.green, soundNumber: 4),
            getKey(colorName: Colors.orange, soundNumber: 5),
            getKey(colorName: Colors.purple, soundNumber: 6),
            getKey(colorName: Colors.indigo, soundNumber: 7),
          ],
        ),
      ),
    );
  }
}
