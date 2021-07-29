import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import 'package:firebase_directory_app/utils/button_widget.dart';
import 'package:firebase_directory_app/utils/custom_textfield_widget.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage>
    with WidgetsBindingObserver {
  final CollectionReference _directory =
      FirebaseFirestore.instance.collection('directory');
  final FirebaseStorage storage = FirebaseStorage.instance;

  File? image;
  bool loading = false;

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
        title: const Text("Add Contact"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.89,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                width: 200,
                color: Colors.grey[300],
                child: image == null
                    ? const Icon(Icons.image)
                    : Image.file(image!),
              ),
              ElevatedButton(
                  onPressed: getImage,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(Icons.image),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("Select Image"),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text("Info Contact",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(label: "Name", controller: _name),
              CustomTextField(label: "Phone", controller: _phone),
              CustomTextField(label: "Appointment", controller: _appointment),
              Expanded(child: Container()),
              ButtonWidget(
                title: "Save", 
                onPressed: _saveContact,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveContact() {
    if (_name.text.length > 1 &&
        _phone.text.length > 1 &&
        _appointment.text.length > 1 &&
        image != null) {
      addContactToFirebase();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Fields cannot be empty"),
        ),
      );
    }
  }

  addDirectory(String url) async {
    await _directory.add({
      'name': _name.text,
      'phone': int.parse(_phone.text),
      'appointment': _appointment.text,
      'image': url,
    }).whenComplete(() {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text("Contact Added")),
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

  addContactToFirebase() async {
    Reference reference = storage.ref().child('directory_images');
    DateTime _imageName = DateTime.now();
    TaskSnapshot upload =
        await reference.child(_imageName.toString() + '.jpg').putFile(image!);
    String url = await upload.ref.getDownloadURL();
    addDirectory(url);
  }
}
