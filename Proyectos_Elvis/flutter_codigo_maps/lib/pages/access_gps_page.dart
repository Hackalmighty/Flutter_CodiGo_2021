
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo_maps/pages/home_page.dart';
import 'package:flutter_codigo_maps/pages/loading_page.dart';
import 'package:permission_handler/permission_handler.dart';

class AccessGPSPage extends StatefulWidget {
  @override
  _AccessGPSPageState createState() => _AccessGPSPageState();
}

class _AccessGPSPageState extends State<AccessGPSPage> with WidgetsBindingObserver{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.resumed){
      if(await Permission.location.isGranted){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadingPage()));
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Es necesario activar el GPS.",
            ),
            SizedBox(
              height: 10,
            ),
            CupertinoButton(
              color: Colors.black87,
              child: Text("Activar GPS"),
              onPressed: () async {
                final status =  await Permission.location.request();
                accessLocation(status);
              },
            )
          ],
        ),
      ),
    );
  }

  void accessLocation(PermissionStatus status){
    switch(status){
      case PermissionStatus.granted:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
        break;
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.denied:
      case PermissionStatus.limited:
      case PermissionStatus.restricted:
        openAppSettings();
        break;
    }
  }
}
