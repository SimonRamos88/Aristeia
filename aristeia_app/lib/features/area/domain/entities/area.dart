import 'dart:io';

class Area {
  late String nombre;
  late List<Tema> subtemas;
  late String descripcion;

  Area(this.nombre, this.descripcion) {
    this.subtemas = [];
  }

  void addSubtemas(Tema tema) {
    this.subtemas.add(tema);
  }
}

//borrar luego
class Tema {}
