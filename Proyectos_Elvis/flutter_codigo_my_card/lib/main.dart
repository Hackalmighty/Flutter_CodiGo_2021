import 'package:flutter/material.dart';

void main() {
  runApp(MandarinaApp());
}

class MandarinaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff1AAF46),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 55.0,
                backgroundImage: NetworkImage(
                    "https://scontent.flim4-3.fna.fbcdn.net/v/t1.0-9/140063044_3617944518271903_5471129712419977931_n.jpg?_nc_cat=105&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeEnDoGkXVvdPeANW5HzYPZv9JXPGB6_vbn0lc8YHr-9uWnDI1EYvD5ds6RK_VeGuZckZVDrBTEOIXgt3Jmno4g1&_nc_ohc=XY1Uv1p8AMEAX_Y9Tdc&_nc_oc=AQmstzn-zA7jO0AJMg4Ix9Kr9xKsfB0OcCpdbOJ4wfQJJJX1BGcErImj-sQU-77KoXI&_nc_ht=scontent.flim4-3.fna&oh=7297c9e39f04677b334e76c59b802639&oe=60436F1D"),
              ),
              Text(
                "Willy Patiño",
                style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "FLUTTER DEVELOPER",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                    letterSpacing: 2.5),
              ),
              SizedBox(
                width: 150.0,
                child: Divider(
                  thickness: 1.5,
                  color: Colors.white30,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListTile(
                  title: Text("tu_correo@gmail.com",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500)),
                  subtitle: Text("Correo Electrónico"),
                  leading: Icon(
                    Icons.mail_outline,
                    size: 34,
                    color: Color(0xff7D99ED),
                  ),
                  trailing: Icon(
                    Icons.check,
                    size: 30,
                    color: Color(0xff7D99ED),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListTile(
                  title: Text("+51 999999999",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w500)),
                  subtitle: Text("Teléfono"),
                  leading: Icon(
                    Icons.phone_android_outlined,
                    size: 34,
                    color: Color(0xff7D99ED),
                  ),
                  trailing: Icon(
                    Icons.check,
                    size: 30,
                    color: Color(0xff7D99ED),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("assets/icons/facebook.png",),
                  width: 42.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Image(image: AssetImage("assets/icons/instagram.png",),
                    width: 42.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Image(image: AssetImage("assets/icons/twitter.png",),
                    width: 42.0,
                  ),
                  ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
