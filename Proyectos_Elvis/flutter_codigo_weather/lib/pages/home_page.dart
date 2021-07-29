import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int temperature = 0;
  String cityName = "London";
  int woeid = 0;

  String weather = "";
  String abbr = "";
  String errorMessage = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getLocationSearch();
  }

  void getSearch(String name) async {
    try {
      var url = Uri.parse(
          "https://www.metaweather.com/api/location/search/?query=$name");
      var result = await http.get(url);
      var decodeJson = json.decode(result.body)[0];
      print(decodeJson);
      setState(() {
        cityName = decodeJson["title"];
        woeid = decodeJson["woeid"];
        errorMessage = "";
      });
    } catch (error) {
      errorMessage = "No se encontró la ciudad, intenta nuevamente.";
      setState(() {

      });
    }
  }

  void getLocation() async {
    var url = Uri.parse("https://www.metaweather.com/api/location/$woeid");
    var result = await http.get(url);
    var decodeJson = json.decode(result.body);
    var consolidateWeather = decodeJson["consolidated_weather"];
    var data = consolidateWeather[0];

    temperature = data["the_temp"].round();
    weather = data["weather_state_name"].replaceAll(" ", "").toLowerCase();
    abbr = data["weather_state_abbr"];
    setState(() {});
  }

  void onTextFieldSubmitted(String value) {
    getSearch(value);
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/$weather.png",
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: Image.network(
                    "https://www.metaweather.com/static/img/weather/png/$abbr.png",
                    height: 80.0,
                  ),
                ),
                Center(
                  child: Text(
                    temperature.toString() + "°C",
                    style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    cityName ?? "",
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    onSubmitted: (String value) {
                      onTextFieldSubmitted(value);
                    },
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                    decoration: InputDecoration(
                      hintText: "Buscar otra ciudad...",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    errorMessage,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}