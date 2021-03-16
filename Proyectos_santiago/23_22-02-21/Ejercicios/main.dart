import 'dart:math';
class FiguraGeometrica{
  double lado;
  int numeroLados;
  FiguraGeometrica(this.lado, this.numeroLados);

  double calcularPerimetro(){
    return lado*numeroLados;
  }

  double calcularArea(){
    if(numeroLados==3){
      return lado*lado*sqrt(3)/4;
    }else if(numeroLados==4){
      return lado*lado;
    }else if(numeroLados==5){
      return numeroLados*lado*lado/4*(1/tan(360/(numeroLados*2)));
    }
  }
}

void main(){
  FiguraGeometrica f = FiguraGeometrica(3,10);
  print(f.calcularPerimetro());
}