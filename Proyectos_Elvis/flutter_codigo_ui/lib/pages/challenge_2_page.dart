import 'package:flutter/material.dart';

class Challenge2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Image(
              image: AssetImage("assets/images/fondo.jpg"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Descripción de la imagen",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Descripción general de la imagen",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.redAccent,
                  ),
                  Text("41"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "CALL",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.alt_route),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "ROUTE",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.share),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "SHARE",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
              child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
              child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
              child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            ),
            Center(
              child: RaisedButton(
                onPressed: (){
                Navigator.pushNamed(context, 'reto4');
              },
              child: Text("Pasar al siguiente reto"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
