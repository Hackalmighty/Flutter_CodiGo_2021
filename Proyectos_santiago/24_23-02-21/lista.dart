class Nodo {
  int valor;
  Nodo siguiente;
  Nodo({this.valor, this.siguiente});
}

class Lista {
  Nodo primero;
  Nodo ultimo;

  void add(int valor) {
    if (primero == null) {
      Nodo n = Nodo(valor: valor);
      primero = n;
      ultimo = n;
    } else {
      Nodo n = Nodo(valor: valor);
      ultimo.siguiente = n;
      ultimo = n;
    }
  }

  void addInicio(int valor) {
    if (primero == null) {
      Nodo n = Nodo(valor: valor);
      primero = n;
      ultimo = n;
    } else {
      Nodo n = Nodo(valor: valor, siguiente: primero);
      primero = n;
    }
  }

  void addInPosition(int valor, int position) {
    int c;
    Nodo n = primero;
    if (position == 0) {
      addInicio(valor);
    } else {
      for (c = 0; c < position - 1; c++) {
        n = n.siguiente;
      }
      Nodo nuevoNodo = Nodo(valor: valor, siguiente: n.siguiente);
      n.siguiente = nuevoNodo;
    }
  }

  void imprimir() {
    Nodo tmp = primero;
    String nodos = "";
    while (tmp != null) {
      nodos += "${tmp.valor} -->";
      tmp = tmp.siguiente;
    }
    print(nodos);
  }

  void imprimirInvertido() {
    Nodo tmp = primero;
    String nodos = "";
    while (tmp != null) {
      nodos = "${tmp.valor} -->" + nodos;
      tmp = tmp.siguiente;
    }
    print(nodos);
  }

  int getFirst() {} //traer el primero
  int getLast() {} //traer el ultimo
  int getInPosition(int position) {} //traer el ultimo
  void remove(int position) {}
  void removeFirst() {
    primero = primero.siguiente;
  }

  void removeLast() {}
  bool find(int valor) {} //si el elemento se encuentra en la lista
  int getPosition(int valor) {} // en que posicion de la lista se encuentra
}

void main() {
  Lista l = Lista();
  l.add(1);
  l.add(5);
  l.add(17);
  l.add(3);
  l.addInicio(50);
  l.addInPosition(100, 1);
  l.removeFirst();
  l.imprimir();
}
