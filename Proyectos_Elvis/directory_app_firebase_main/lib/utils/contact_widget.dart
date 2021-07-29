import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_directory_app/pages/detail_page.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    Key? key,
    required this.contact,
  }) : super(key: key);

  final QueryDocumentSnapshot contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: const Offset(0, 2),
          color: Colors.black.withOpacity(0.3),
          blurRadius: 5,
        ),
      ]),
      child: ListTile(
        tileColor: Colors.white,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(contact['image']),
          backgroundColor: Colors.grey[200],
        ),
        title: Text(contact['name']),
        subtitle: Text(contact['appointment']),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => DetailPage(
                        contact: contact,
                      )));
        },
      ),
    );
  }
}
