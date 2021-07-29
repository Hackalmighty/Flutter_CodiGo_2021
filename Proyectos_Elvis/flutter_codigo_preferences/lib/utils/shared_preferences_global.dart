
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{

  static final UserPreference _instancia = new UserPreference._internal();

  UserPreference._internal();

  factory UserPreference(){
    return _instancia;
  }

  SharedPreferences _prefs;

  initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // int _llantas = 4;
  //
  // int get llanta => _prefs.getInt("genero") ?? 1;
  // set llanta(int value)=> _prefs.setInt("genero", value);

  int get genero{
    return _prefs.getInt("genero") ?? 1;
  }

  set genero(int value){
    _prefs.setInt("genero", value);
  }

  get name{
    return _prefs.getString("namex") ?? "No hay nombre";
  }

  set name (String value){
    _prefs.setString("namex", value);
  }

  get address{
    return _prefs.getString("address") ?? "No hay dirección";
  }

  set address (String value){
    _prefs.setString("address", value);
  }

  get color{
    return _prefs.getBool("colorSecundario") ?? false;
  }

  set color (bool value){
    _prefs.setBool("colorSecundario", value);
  }


}