import 'dart:io';

class Usuario {
  late String usertag;
  late String nombres;
  late String email;
  late List<Roadmap> roadmapCreados;
  late List<Roadmap> roadmapCopiados;
  late DateTime fechaCreacionCuenta;
  late String clave;

  Usuario(this.usertag, this.nombres, this.clave, this.email) {
    fechaCreacionCuenta = DateTime.now();
    roadmapCopiados = [];
    roadmapCreados = [];
  }

  void agregarRoadmap(Roadmap roadmap, List<Roadmap> lista) {
    lista.add(roadmap);
  }

  void borrarRoadmap(Roadmap roadmap, List<Roadmap> lista) {
    lista.remove(roadmap);
  }
}
