class Nodo {
  int valor;
  Nodo nodo_superior;
  Nodo(this.valor, this.nodo_superior);
}

class Cola {
  Nodo primer_nodo;
  Nodo ultimo_nodo;
  void push(int i) {
    if (primer_nodo == null) {
      Nodo n = Nodo(i, null);
      primer_nodo = n;
      ultimo_nodo = n;
    } else {
      Nodo n = Nodo(i, null);
      ultimo_nodo.nodo_superior = n;
      ultimo_nodo = n;
    }
  }

  int pop() {
    int valor = primer_nodo.valor;
    primer_nodo = primer_nodo.nodo_superior;
    return valor;
  }

  void imprimir() {
    Nodo tmp = primer_nodo;
    while (tmp != null) {
      print("|\t${tmp.valor}\t|");
      tmp = tmp.nodo_superior;
    }
  }

  String toString() => primer_nodo.valor.toString();
}

void main() {
  Cola c = Cola();
  c.push(15);
  c.push(17);
  c.push(20);
  c.push(24);
  c.push(25);
  c.imprimir();
  print(c.pop());
  print(c.pop());
  print(c.pop());
  print(c.pop());
}

// Imprimir una cola pero al revez es decir el ultimo al primero
// implementar un mentodo que nos diga si la fila esta vacia
// Implentar una clase padre Estructura de la cual heremos Pila y Cola y solo implementemos los atributos necesarios
