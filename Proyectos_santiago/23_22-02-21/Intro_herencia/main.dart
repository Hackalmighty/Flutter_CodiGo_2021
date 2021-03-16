class Factura{
  int numero;
  double descuento;
  List<Aparato> detalle;
  Factura(this.numero, this.descuento, this.detalle);

  double obtenerTotal(){
    double t = 0;
    detalle.forEach((aparato) {t+=aparato.precio;});
    return t;
  }

  String toString()=> "Factura N° $numero: \n${detalle.join("\n")} \nTotal: ${obtenerTotal()}";
}

class Aparato{
  String marca;
  double precio;
  int voltaje;
  Aparato (this.marca, this.precio, this.voltaje);
  String toString()=> "Aparato: $precio";
}

class Televisor extends Aparato{
  int pulgadas;
  Televisor(marca, precio, voltaje, this.pulgadas) : super(marca, precio, voltaje);
  String toString()=>"Televisor $marca $pulgadas: $precio";
}

class EquipoSonido extends Aparato{
  int cds;
  EquipoSonido(marca, precio, voltaje, this.cds):super(marca, precio,voltaje);
  String toString()=>"Equipo de sonido $marca a $precio para $cds CD's y con voltaje de $voltaje";
}

void main(){
  Televisor a = Televisor("LG", 100.0, 100,50);
  EquipoSonido e = EquipoSonido("HP", 100.0, 110,3);
  Factura f = Factura(1,0,[a, e]);
  print(f);

}