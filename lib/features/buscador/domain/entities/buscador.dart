
//Nos dice si una subcadena está en una fraccion de una cadena,

import 'dart:async';
import 'dart:developer';

import 'package:aristeia_app/features/roadmap/domain/entities/show_road.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../core/network/auth.dart';
import '../../../../core/widgets/roadmap_card.dart';
import '../../../roadmap/domain/repositories/calcular_promedio.dart';
import '../../../roadmap/domain/repositories/getEstado.dart';
import '../../../roadmap/domain/repositories/total_bloques.dart';

class Buscador extends showRoad{

  List<dynamic> resultados = [];

  Future<List<Map>> roadsPrivados() async {

    List<Map> privs = [];
    QuerySnapshot stream = await FirebaseFirestore.instance
            .collection('roadmap')
            .where("creador", isEqualTo: Auth().currentUser!.uid)
            .get();

    int i=0;
    List docs = stream.docs;
    while(i<docs.length){
      Map data = docs[i].data();
      data['id'] = docs[i].id;
      privs.add(data);
      i ++;
    }
    return privs;
  }

  bool inPart(int ini, int fin, String sub, String cad){
        int j = 0;
        bool bandera = true;

        while( bandera && ini <= fin){

            if(sub[j] != cad[ini]){
                bandera = false;
            }else{
                ini ++;
                j ++;
            }

        }

        return ini > fin;
    }



    //Nos dice si una cadena es subcadena de otra
    //Si si es subcadena, la pushea en una lista
    bool isSub(String sub, String cad){
        int i = 0;
        int nSub = sub.length;
        int nCad = cad.length;

        bool bandera = false;

        while(!bandera && i<=nCad-nSub){
            bandera = inPart(i, i+nSub-1, sub, cad);
            i++;

        }
        return bandera;
    }

    void Buscar( String input, List<Map> roadmaps){
      this.resultados = [];
      for(dynamic road in roadmaps){
        if( isSub(input, road['nombre'])){
          this.resultados.add(road);
        }
      }

    }

    bool roadHasEt( List etiquetas, Map road){
      int i=0;
      Map etiquetasRoad = {};
      for(var et in road['etiquetas']){
        etiquetasRoad[i] = et;
        i ++;
      } 
      bool bandera = true;
      int j = 0;
      while(j<etiquetas.length && bandera){
        bandera = bandera && etiquetasRoad.containsValue(etiquetas[j]);
        j ++;
      }

      return bandera;
    }

    
    void BuscarByEt(List<String> etiquetas) async {
      this.resultados = [];
      List<Map> privs = await roadsPrivados();
      if(etiquetas.isNotEmpty){
        for(Map road in privs){
          log('r ' + road.toString());
          if( roadHasEt(etiquetas, road)){
            this.resultados.add(road);
          }
        }
      }else{
        this.resultados = privs;
      }
      
    }

    void ShowResults(){

      log(this.resultados.toString());
    }

    @override
    Widget getRoadmap(String filter) {

      log('res: ' + this.resultados.toString());
      return ListView.builder(
        itemCount: this.resultados.length,
        itemBuilder: (context,index){
          return FutureBuilder<double>(
                future: calcularPromedio(resultados[index]['id']),
                builder: (context, snapshot) {
                  double promedio = snapshot.data ?? 0.0;
                  // Función para calcular el total de bloques que tiene el roadmap
                  return FutureBuilder<int>(
                    future: totalBloques(resultados[index]['id']),
                    builder: (context, snapshot) {
                      int cantidadBloques = snapshot.data ?? 0;
                      // Función para determinar el estado del roadmap
                      return FutureBuilder<int>(
                          future: getEstado(resultados[index]['id']),
                          builder: (context, snapshot) {
                            int estadoRoadmap = snapshot.data ?? 0;
                            return RoadmapCard(
                                myRoadmap: true,
                                nombreRoadmap: resultados[index]['nombre'],
                                descripcionRoadmap: resultados[index]['descripcion'],
                                estadoRoadmap: estadoRoadmap,
                                etiquetas: resultados[index]['etiquetas'],
                                cantidadBloques: cantidadBloques,
                                calificacion: promedio,
                                onTap: () => {
                                      context.router.navigateNamed(
                                        ('/logged/personal/${resultados[index]['id']}'),
                                      )
                                    });
                          });
                    },
                  );
                },
              );
        }
        );


    }

    


}

