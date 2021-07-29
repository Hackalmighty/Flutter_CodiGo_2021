const frutasGeneral=["Manzana","Pera","Papaya","Mandarina"];

class Fruta {

  Stream<List<String>> getStreamFrutas() async*{

    List fruta = [];
    for(String item in frutasGeneral){
      fruta.add(item);
      yield fruta;
    }

  }

  Future<String> getName() async{
    return "Vinosolo";
  }


}