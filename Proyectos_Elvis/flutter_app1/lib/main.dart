import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffFFCD00),
        appBar: AppBar(
          backgroundColor: Color(0xffB0AB48),
          title: Center(
            child: Text("Willy Patiño"),
          ),
        ),
        body: Center(
          child: Image(
            image: AssetImage("assets/images/corolla_gr_sport.png"),
          ),
        ),
      ),
    ),
  );
}
