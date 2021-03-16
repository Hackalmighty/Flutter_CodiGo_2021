class Pila {
  Nodo nodo_actual;

  void push(String i) {
    Nodo n = Nodo(i, nodo_actual);
    nodo_actual = n;
  }

  String pop() {
    String valor = nodo_actual.valor;
    nodo_actual = nodo_actual.nodo_inferior;
    return valor;
  }

  bool estaVacio() => nodo_actual == null;
  Pila();

  String toString() => nodo_actual.toString();
  void imprimir() {
    Nodo tmp = nodo_actual;
    while (tmp != null) {
      print("|\t${tmp.valor}\t|");
      tmp = tmp.nodo_inferior;
    }
  }
}

class Nodo {
  String valor;
  Nodo nodo_inferior;
  Nodo(this.valor, this.nodo_inferior);
  String toString() => valor.toString();
}

bool verificarExpresion(String expresion) {
  Pila pila = Pila();
  for (int i = 0; i < expresion.length; i++) {
    if (expresion[i] == "(") pila.push("(");
    if (expresion[i] == ")") {
      if (pila.estaVacio()) return false;
      String p = pila.pop();
    }
    ;
  }
  return pila.estaVacio();
}

void main() {
  String expresion = " (5+6 / (2 )* (2+3)))(";
  print(verificarExpresion(expresion));
}

/* 1.- agregar soporte para {}[]
// 2.- impriman la pila, pero de abajo hacia arriba,
// 3.- investigar como en dart podemos tener una clase pila que
funcione para int, strings, doubles, booleanos y cualquie otra clase*/
