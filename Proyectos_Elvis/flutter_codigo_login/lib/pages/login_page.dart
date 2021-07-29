import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //Fondo
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/image_01.png"),
                ),
                Expanded(
                  child: Container(),
                ),
                Image.asset("assets/images/image_02.png")
              ],
            ),
            // Logo y formulario
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    //Logo
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: 80,
                        ),
                        Text(
                          "Finn",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                              letterSpacing: 0.7,
                              fontFamily: 'Poppins-Bold'),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    // FormLogin
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 12),
                              blurRadius: 10.0,
                            ),
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, -5),
                              blurRadius: 8,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 22,
                                  fontFamily: "Poppins-Bold"),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Username:",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14.0,
                                  fontFamily: "Poppins-Medium"),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13.0,
                                  )),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "Password:",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14.0,
                                  fontFamily: "Poppins-Medium"),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13.0,
                                  )),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 16.0,
                                      fontFamily: "Poppins-Medium"),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            //Radio
                            GestureDetector(
                              onTap: () {
                                isSelected = !isSelected;
                                setState(() {});
                              },
                              child: Container(
                                height: 16,
                                width: 16,
                                padding: EdgeInsets.all(1.5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2, color: Colors.black87)),
                                child: isSelected
                                    ? Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xff2BCCDD),
                                          shape: BoxShape.circle,
                                        ),
                                      )
                                    : Container(),
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            //TextRadio
                            Text(
                              "Remember me",
                              style: TextStyle(
                                  fontSize: 12.0, fontFamily: "Poppins-Medium"),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              gradient: LinearGradient(colors: [
                                Color(0xff1CE8DA),
                                Color(0xff5E7AEB),
                              ]),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontFamily: "Poppins-Bold"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          height: 1,
                          width: 60,
                          color: Colors.black38.withOpacity(0.3),
                        ),
                        Text(
                          "Social Login",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18.0,
                              fontFamily: "Poppins-Medium"),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 17),
                          height: 1,
                          width: 60,
                          color: Colors.black38.withOpacity(0.3),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialIconWidget(
                          name: "facebook",
                          colors: [
                            Color(0xff205BC5),
                            Color(0xff0DCBF1)
                          ],
                        ),
                        SocialIconWidget(
                          name: "google",
                          colors: [
                            Color(0xffFF503D),
                            Color(0xffFF503D)
                          ],
                        ),
                        SocialIconWidget(
                          name: "twitter",
                          colors: [
                            Color(0xff205BC5),
                            Color(0xff0DCBF1)
                          ],
                        ),
                        SocialIconWidget(
                          name: "linkedin",
                          colors: [
                            Color(0xff205BC5),
                            Color(0xff0DCBF1)
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialIconWidget extends StatelessWidget {

  String name;
  List<Color> colors;

  SocialIconWidget({this.name, this.colors});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.all(10.0),
      height: 45,
      width: 45,
      child: Image.asset("assets/images/$name.png"),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: colors
        ),
      ),
    );
  }
}
