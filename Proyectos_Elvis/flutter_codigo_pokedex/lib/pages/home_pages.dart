import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List listPokemon;

  Map<String, Color> mapColor = {
    "Grass": Color(0xff48D0B0),
    "Fire": Color(0xffFB6C6C),
    "Water": Color(0xff76BCFD),
  };

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var url = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    var res = await http.get(url);
    var decodeJson = json.decode(res.body);
    listPokemon = decodeJson["pokemon"];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "PokeApp",
          style: TextStyle(
              fontSize: 30,
              color: Colors.black87.withOpacity(0.9),
              fontWeight: FontWeight.w700),
        ),
      ),
      body: listPokemon == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: 2,
              children: listPokemon
                  .map(
                    (poke) => Card(
                      margin: EdgeInsets.all(5.0),
                      elevation: 7.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      color: mapColor[poke["type"][0]] ?? Colors.white,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  poke["name"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: poke["type"].map<Widget>((e)=>Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 7, vertical: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14.0),
                                        color: Colors.greenAccent,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 12.0,
                                            offset: Offset(2, 5),
                                          ),
                                        ],
                                      ),
                                      child: Text(e,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  )).toList(),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -20,
                            right: -10,
                            child: Container(
                              height: 120.0,
                              width: 120.0,
                              child: Image.asset(
                                "assets/images/pokeball.png",
                                color: Colors.white.withOpacity(0.35),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 0,
                            child: Container(
                              height: 130.0,
                              width: 130.0,
                              child: Image.network(
                                poke["img"],
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList()),
    );
  }
}
