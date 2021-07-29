import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  CollectionReference taskFirebase = FirebaseFirestore.instance.collection('task');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    // print("Creando stream...");
    // Stream<String> federica = new Stream.fromFuture(getData());
    // print("Creando creado");
    // federica.listen((event) {
    //   print("DATA RECIBIDA: $event");
    // },onDone: (){
    //   print("Tarea hecha");
    // },onError: (error){
    //   print("Error");
    // });



    // taskFirebase.doc("YK4zNeLyOOQqBBHQ0XHj").get().then((value){
    // print(value);
    // }).catchError((error){
    //   print(error);
    // });

    taskFirebase.snapshots().listen((event) {print(event.docs[0].id);});
  }

  Future<String> getData()async{
    await Future.delayed(Duration(seconds: 5));
    print("data obtenida");
    return "esta es la data del getData";
  }

  Future<void> addTaskFirebase(){
    return taskFirebase.add({
      "description": "Tarea desde flutter",
      "completed": false,      
    }).then((value) => print(value)).catchError((error)=>print(error));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Firebase Task")
      ),
      body: StreamBuilder(
        stream: taskFirebase.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){

          List<DocumentSnapshot> documentos = snapshot.data.docs;

          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView.builder(itemCount: documentos.length,
          itemBuilder: (context,index){
            Map<String, dynamic> data = documentos[index].data();
            return ListTile(
              title: Text(data['description']),
              leading: Checkbox(
                value: data['completed'],
              ),
            );
          });
        },
      ),
    );
  }
}
