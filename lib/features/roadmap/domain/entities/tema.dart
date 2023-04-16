
import 'roadmap.dart';

class Tema{

  List<String> campos = [];
  List<Roadmap> roadmapsSugeridos = [];

  //CONSTRUCTORES
  Tema(){

  }
  
  Tema.full(List<String> campos, List<Roadmap> sug){
    this.campos = campos;
    this.roadmapsSugeridos = sug;
  }
  Tema.campos(List<String> campos){
    this.campos = campos;
  }

}