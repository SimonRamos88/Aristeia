
// TO DO: meter los import necesarios
import '../../../usuario/domain/entities/usuario.dart';
import '../../../etiqueta/domain/entities/etiqueta.dart';
import '../entities/calificacion.dart';
import '../entities/tema.dart';

class Roadmap {

  Usuario usuario;
  String nombre;
  //List<Calificacion> calificaciones = [];
  List<Etiqueta> etiquetas = [];
  Tema tema = Tema();
  //List<Bloque> bloques = [];
  bool publico;
  String descripcion;
  DateTime fechaInicio;

  //CONSTRUCTOR
  Roadmap({
    required this.usuario, 
    required this.nombre,
    required this.descripcion,
    required this.publico,
    }):this.fechaInicio = DateTime.now();

}