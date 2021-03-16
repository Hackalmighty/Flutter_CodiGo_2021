import 'package:flutter/material.dart';
import 'package:flutter_codigo_whatsapp/models/chat_model.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataListChat.length,
      itemBuilder: (BuildContext context, int index) {

        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 23.0,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(dataListChat[index].avatarURL),
              ),
              title: Text(
                dataListChat[index].name,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
              ),

              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dataListChat[index].time,
                    style: TextStyle(fontSize: 13.0, color: Colors.black54),
                  ),
                  SizedBox(height: 5,),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 50.0, right: 20.0),
              child: Divider(
                height: 10,
                thickness: 0.5,
              ),
            )
          ],
        );
      },
    );
  }
}