class Persona{
  String nombre;
  String apellido;
  int edad;

  Persona(this.nombre, this.apellido, this.edad);
  String toString()=> "$nombre $apellido";

  List<String> obtenerRegistrosPoliciales(){
    return["Salio en toque de queda"];
  }
}

class Alumno extends Persona{
  List<String>cursos;

  Alumno(nombre, apellido, edad, cursos) : super(nombre, apellido, edad){
    this.cursos = cursos;
  }
}

class Profesor extends Persona{
  double sueldo;
  Profesor(nombre, apellido, edad, this.sueldo) : super(nombre, apellido, edad);
}


class AlumnoRegular extends Alumno{
  AlumnoRegular(nombre, apellido, edad, cursos) : super(nombre, apellido, edad,cursos);
}

void main(){
  AlumnoRegular p1 = AlumnoRegular("Santiago", "Lovon", 19,["economia"]);
  print(p1.edad);
}
