import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:nbapp/models/player.dart';

class PlayersView extends StatefulWidget {
  final Datum jugador;

  PlayersView(this.jugador);
  @override
  _PlayersViewState createState() => _PlayersViewState();
}

class _PlayersViewState extends State<PlayersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/originals/e9/5f/56/e95f56d52fea3ab71221fdc5d10efbd0.jpg"),
                    fit: BoxFit.cover)),
          ),
          Positioned(
              top: 55,
              left: 15,
              child: IconButton(
                  iconSize: 35,
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Lista de Players",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(3.0, 3.0),
                      blurRadius: 3.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: http.get(Uri.parse(
                      "https://www.balldontlie.io/api/v1/games?seasons[]=2020&team_ids[]=${widget.jugador.id}")),
                  builder: (c, s) {
                    if (s.hasData) {
                      List<Players> player = jsonDecode(s.data.body)["data"]
                          .map<Players>((m) => Datum.fromJson(m))
                          .toList();

                      return Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  itemCount: player.length,
                                  itemBuilder: (c, m) =>
                                      Playercard(player: player[m])),
                            ),

                          ],
                        ),
                      );
                    }
                    if (s.hasError) {
                      return Center(
                        child: Text(s.error.toString()),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildResultados(int victorias, int derrotas) {
    return Container(
        padding: EdgeInsets.all(8),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text("Victorias", style: TextStyle(fontSize: 20)),
                Text(
                  victorias.toString(),
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Text("Derrotas", style: TextStyle(fontSize: 20)),
                Text(
                  derrotas.toString(),
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ));
  }
}

class Playercard extends StatelessWidget {
  Playercard({
    Key key,
    @required this.player,
  }) : super(key: key);

  final Datum player;
  final String urlLogo =
      "https://www.nba.com/.element/img/1.0/teamsites/logos/teamlogos_500x500/";
  final DateFormat format = DateFormat("dd/MM/y");

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.white.withOpacity(0.8),
      margin: EdgeInsets.only(top: 8, left: 24, right: 24),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Nombre: " + player.firstName ),
          ],
        ),
      ),
    );
  }
}