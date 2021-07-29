import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_directory_app/pages/home_page.dart';
import 'package:firebase_directory_app/utils/custom_textfield_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import 'package:firebase_directory_app/utils/button_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.contact}) : super(key: key);
  final QueryDocumentSnapshot contact;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with WidgetsBindingObserver {
  final CollectionReference _directory =
      FirebaseFirestore.instance.collection('directory');
  final FirebaseStorage storage = FirebaseStorage.instance;
  bool edit = false;

  File? image;

  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _appointment = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Contact"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // ignore: sized_box_for_whitespace
          child: Container(
            height: MediaQuery.of(context).size.height * 0.89,
            child: edit == false ? infoWidget(context) : editWidget(context),
          ),
        ),
      ),
    );
  }

  Column infoWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: widget.contact['image'] == null
              ? const Icon(
                  Icons.image,
                  size: 50,
                  color: Colors.black38,
                )
              : Image.network(widget.contact['image']),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(widget.contact['name']),
              ),
              ListTile(
                leading: const Icon(Icons.phone_android),
                title: Text(widget.contact['phone'].toString()),
              ),
              ListTile(
                leading: const Icon(Icons.business),
                title: Text(widget.contact['appointment']),
              ),
            ],
          ),
        ),
        Expanded(child: Container()),
        ButtonWidget(
          title: "Edit",
          onPressed: () {
            setState(() {
              edit = true;
            });
          },
        ),
        ButtonWidget(
          title: "Delete",
          onPressed: deleteDirectory,
          color: Colors.red,
        ),
      ],
    );
  }

  Column editWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: image == null
              ? TextButton(
                  onPressed: getImage,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.image,
                        size: 50,
                      ),
                      const Text("Change Image"),
                    ],
                  ))
              : Image.file(image!),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomTextField(label: "Name", controller: _name),
              CustomTextField(label: "Phone", controller: _phone),
              CustomTextField(label: "Apponintment", controller: _appointment),
            ],
          ),
        ),
        Expanded(child: Container()),
        ButtonWidget(
          title: "Save",
          onPressed: _editContact,
        ),
        ButtonWidget(
          title: "Cancel",
          onPressed: () => setState(() {
            edit = false;
          }),
          color: Colors.grey,
        ),
      ],
    );
  }

  void _editContact() {
    if (_name.text.length > 1 &&
        _phone.text.length > 1 &&
        _appointment.text.length > 1 &&
        image != null) {
      updateContactToFirebase();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Fields cannot be empty"),
        ),
      );
    }
  }

  updateDirectory(String url) async {
    await _directory.doc(widget.contact.id).update({
      'name': _name.text,
      'phone': int.parse(_phone.text),
      'appointment': _appointment.text,
      'image': url,
    }).whenComplete(() {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()),
          (route) => false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text("Contact Update")),
      );
    }).catchError((error) => error);
  }

  getImage() async {
    final picker = ImagePicker();
    var tempImage = await picker.pickImage(source: ImageSource.gallery);
    if (tempImage != null) {
      setState(() {
        image = File(tempImage.path);
      });
    }
  }

  updateContactToFirebase() async {
    Reference reference = storage.ref().child('directory_images');
    DateTime _imageName = DateTime.now();
    TaskSnapshot upload =
        await reference.child(_imageName.toString() + '.jpg').putFile(image!);
    String url = await upload.ref.getDownloadURL();
    updateDirectory(url);
  }

  deleteDirectory() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Are you sure to delete this contact?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () async {
                  _directory.doc(widget.contact.id).delete().then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomePage()),
                        (route) => false);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Contact deleted"),
                    ));
                  }).catchError((error) => error);
                },
                child: const Text("Confirm"),
              ),
            ],
          );
        });
  }
}
