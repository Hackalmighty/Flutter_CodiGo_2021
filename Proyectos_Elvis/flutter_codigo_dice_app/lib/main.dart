import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DicePage());
  }
}
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}
class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B2B2B),
      appBar: AppBar(
        backgroundColor: Color(0xff2B2B2B),
        title: Text("Dice App"),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: FlatButton(
                onPressed: (){
                  leftDiceNumber = Random().nextInt(6) + 1;
                  rightDiceNumber = Random().nextInt(6) + 1;
                  setState(() {
                  });
                },
                child: Image(
                  image: AssetImage("assets/images/dice$leftDiceNumber.png"),
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: (){
                  rightDiceNumber = Random().nextInt(6) + 1;
                  leftDiceNumber = Random().nextInt(6) + 1;
                  setState(() {
                  });
                },
                child: Image(
                  image: AssetImage("assets/images/dice$rightDiceNumber.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}