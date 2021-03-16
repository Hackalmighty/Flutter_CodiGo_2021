import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RetoPage());
  }
}


class RetoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 160,
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                children: [
                  Text(
                    "Phone Number",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                child: Divider(
                  height: 30,
                  thickness: 2.8,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                child: Divider(
                  height: 30,
                  thickness: 2.8,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.lightBlue,
                child: ListTile(
                  title: Center(
                    child: Text("Log In", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text("Forgot password? No yawa. Tap me",
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Color(0xffE0E0E0),
                child: ListTile(
                  title: Center(
                    child: Text("No Account? Sign up", style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}