
import 'package:flutter/material.dart';
import 'file:///D:/CodiGo%20Flutter/Proyectos_santiago/flutter_codigo_preferences/lib/pages/counter_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CounterPage()));
          },
          child: Text("Ir al contador"),
        ),
      ),
    );
  }
}
