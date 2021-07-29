import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo_maps/pages/access_gps_page.dart';
import 'package:flutter_codigo_maps/pages/home_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver{

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
      if(await Geolocator.isLocationServiceEnabled()){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: checkLocationGlobalAndPermissions(),
          builder: (BuildContext context, AsyncSnapshot snap){
            if(snap.hasData){
              return Center(
                child: Text(snap.data),
              );
            }else{
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }

          },
        )
    );
  }

  Future checkLocationGlobalAndPermissions() async {

    final statusGeolocator = await Geolocator.isLocationServiceEnabled();
    final statusPermission = await Permission.location.isGranted;

    if(statusGeolocator && statusPermission){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      return "";
    }else if(!statusPermission){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AccessGPSPage()));
      return "";
    }else{
      return "Activa el GPS del dispositivo.";
    }

  }

}
