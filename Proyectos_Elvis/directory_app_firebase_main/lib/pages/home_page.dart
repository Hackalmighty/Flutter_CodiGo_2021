import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_directory_app/pages/loading_page.dart';
import 'package:firebase_directory_app/pages/add_contact_page.dart';
import 'package:firebase_directory_app/utils/contact_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _directory =
      FirebaseFirestore.instance.collection('directory');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Directory App",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // ignore: sized_box_for_whitespace
          child: Container(
            height: MediaQuery.of(context).size.height * 0.89,
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder(
                    stream: _directory.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        List<QueryDocumentSnapshot> list = snapshot.data.docs;
                        return ListView.builder(
                          padding: const EdgeInsets.only(top: 15),
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return ContactWidget(
                              contact: list[index],
                            );
                          },
                        );
                      } else {
                        const LoadingPage();
                      }
                      return const LoadingPage();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => const AddContactPage())),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
