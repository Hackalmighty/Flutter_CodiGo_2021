List ordenarLista(List numeros) {
  for (int i = 0; i < numeros.length; i++) {
    for (int j = i; j < numeros.length; j++) {
      if (numeros[i] > numeros[j]) {
        int tmp = numeros[j];
        numeros[j] = numeros[i];
        numeros[i] = tmp;
      }
    }
  }
  return numeros;
}

bool estaEnLista(List numeros, int numero) {
  for (int i = 0; i < numeros.length; i++) {
    if (numeros[i] == numero) return true;
  }
  return false;
}

bool estaEnLista2(List numeros, int numero) {
  int inicio = 0;
  int fin = numeros.length - 1;
  int cont = 0;
  while (inicio <= fin) {
    cont++;
    if (numero > numeros[(inicio + fin) ~/ 2]) {
      inicio = (inicio + fin) ~/ 2 + 1;
    } else if (numero < numeros[(inicio + fin) ~/ 2]) {
      fin = (inicio + fin) ~/ 2 - 1;
    } else {
      return true;
    }
  }
  return false;
}

class Alumno {
  int codigo;
  String nombre;
  Alumno(this.codigo, this.nombre);
  String toString() => nombre;
}

void main() {
  print("Santiago");
  List palabras = [
    Alumno(1, "Santiago"),
    Alumno(3, "Willy"),
    Alumno(2, "Wilmar"),
    Alumno(4, "Jesus")
  ];
  palabras.sort((alumno1, alumno2) => alumno1.nombre.compareTo(alumno2.nombre));
  print(palabras);
}
