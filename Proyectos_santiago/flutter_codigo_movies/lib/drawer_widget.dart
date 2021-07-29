import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/0e/dd/e5/0edde5f70d28584df7c5d2f0d6b44889.jpg"),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/718261/pexels-photo-718261.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  radius: 30,
                ),
                Text(
                  "Benito Lopez Guzman",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Administrador",
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Peliculas"),
            trailing: Icon(Icons.local_movies),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            title: Text("Televisión"),
            trailing: Icon(Icons.live_tv),
            onTap: (){

            },
          ),
          Divider(),
          ListTile(
            title: Text("Cerrar Sesión"),
            trailing: Icon(Icons.close),
            onTap: (){

            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
