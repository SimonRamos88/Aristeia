import 'dart:developer';

import 'package:aristeia_app/core/network/auth.dart';
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:aristeia_app/core/widgets/resource_card.dart';
import 'package:aristeia_app/features/Recurso/domain/repositories/addRecurso.dart';
import 'package:aristeia_app/features/Recurso/domain/repositories/getAllRecursos.dart';
import 'package:aristeia_app/features/Recurso/domain/repositories/getRecurso.dart';
import 'package:aristeia_app/features/Recurso/domain/repositories/updateRecurso.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/change_resource_state.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/setEstado.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/box_text.dart';
import '../../../usuario/domain/repositories/getUsuarioId.dart';
import '../../../../core/widgets/state_widget.dart';

@RoutePage()
class CreateResourceScreen extends StatefulWidget {
  static final gradients = AppGradients();

  final int blockId;
  final int roadId;

  const CreateResourceScreen({
    super.key,
    required this.roadId,
    @PathParam() required this.blockId,
  });

  @override
  State<CreateResourceScreen> createState() => _CreateResourceScreenState();
}

class _CreateResourceScreenState extends State<CreateResourceScreen> {
  final colors = AppColors();
  final Map<int, Map<String, dynamic>> recursos = {};
  Map<String, dynamic> bloqueCreado = {};

  Future<void> traerBloque(String roadmapId, String bloqueId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    //instanciamos la db y buscamos la coleccion
    CollectionReference collectionReferenceRoadmap = db.collection('roadmap');
    //antes que nada, verificamos que la informacion esté correcta
    DocumentSnapshot query = await collectionReferenceRoadmap
        .doc(roadmapId)
        .collection('bloques')
        .doc(bloqueId)
        .get();
    setState(() {
      bloqueCreado = query.data() as Map<String, dynamic>;
      estadoBloque =
          bloqueCreado["estado"] == null ? 0 : bloqueCreado["estado"];
      print(bloqueCreado);
    });
  }

  // reorder method

  void agregarRecurso() {
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController descripcionController = TextEditingController();
    final TextEditingController linksController = TextEditingController();
    final TextEditingController autorController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) => SingleChildScrollView(
        child: AlertDialogWidget(
          insetPadding: true,
          width: MediaQuery.of(context).size.width,
          color: 2,
          tituloGeneral: false,
          tituloPersonalizado: Text(
            'Agregar recurso',
            style: heading2bStyle.copyWith(color: colors.pinkColor),
            textAlign: TextAlign.center,
          ),
          more: Column(
            children: [
              InputField(
                  hintText: 'Nombre recurso', controller: nombreController),
              InputField(
                  hintText: 'Descripción',
                  maxLines: 3,
                  controller: descripcionController),
              InputField(
                  hintText: 'Links', maxLines: 3, controller: linksController),
              Text(
                'Por favor, ingrese los links separados por espacios',
                style: bodyStyle.copyWith(color: colors.pinkColor),
                textAlign: TextAlign.center,
              ),
              InputField(
                  hintText: 'Autor', maxLines: 3, controller: autorController),
            ],
          ),
          rightText: 'Agregar',
          leftText: 'Cancelar',
          onTapRight: () async {
            int recursoId = await getRecursoAmount(
                    widget.roadId.toString(), widget.blockId.toString()) +
                1;
            var usuario = await getUsuariobyId(Auth().currentUser!.uid);
            String nombre = usuario['nombres'];
            createRecurso({
              'nombre': nombreController.text,
              'descripcion': descripcionController.text,
              'links_relacionados': StringToList(linksController.text),
              'autor': autorController.text,
            }, widget.roadId.toString(), widget.blockId.toString(),
                recursoId.toString());

            setState(() {
              //myTiles.add(nombreController.text);
              recursos[recursoId] = {
                'nombre': nombreController.text,
                'descripcion': descripcionController,
                'links_relacionados': linksController,
                'autor': autorController.text,
              };
            });
            nombreController.clear();
            descripcionController.clear();
            linksController.clear();
            log(recursos.toString());
            Navigator.of(context).pop();
          },
          onTapLeft: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  getListaRecursos() async {
    List listaRecursos =
        await getRecursos(widget.roadId.toString(), widget.blockId.toString());
    for (final e in listaRecursos) {
      //log("log: " + e['nombre'] + e.id);
      int keyR = int.parse(e.id);
      recursos[keyR] = e.data() as Map<String, dynamic>;
    }
  }

  void editarRecurso(int recursoId) async {
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController descripcionController = TextEditingController();
    final TextEditingController linksController = TextEditingController();
    final TextEditingController autorController = TextEditingController();

    Map<String, dynamic> recurso = await getRecurso(widget.roadId.toString(),
        widget.blockId.toString(), recursoId.toString());

    nombreController.text = recurso['nombre'];
    descripcionController.text = recurso['descripcion'];
    autorController.text = recurso['autor'];
    List<String> listaLinks = recurso['links_relacionados']
        .map((elemento) => elemento.toString())
        .whereType<String>()
        .toList();
    linksController.text = listaLinks.join(' ');
    showDialog(
      context: context,
      builder: (BuildContext context) => SingleChildScrollView(
        child: AlertDialogWidget(
          insetPadding: true,
          width: MediaQuery.of(context).size.width,
          color: 2,
          tituloGeneral: false,
          tituloPersonalizado: Text(
            'Editar recurso',
            style: heading2bStyle.copyWith(color: colors.pinkColor),
            textAlign: TextAlign.center,
          ),
          more: Column(
            children: [
              InputField(
                  hintText: 'Nombre recurso', controller: nombreController),
              InputField(
                  hintText: 'Descripción',
                  maxLines: 3,
                  controller: descripcionController),
              InputField(
                  hintText: 'Links', maxLines: 2, controller: linksController),
              InputField(
                  hintText: 'Autor', maxLines: 2, controller: autorController),
            ],
          ),
          rightText: 'Editar',
          leftText: 'Cancelar',
          onTapRight: () async {
            print("En update");
            print(linksController.text);
            updateRecurso(widget.roadId.toString(), widget.blockId.toString(),
                recursoId.toString(), {
              'nombre': nombreController.text,
              'descripcion': descripcionController.text,
              'links_relacionados': StringToList(linksController.text),
              'autor': autorController.text,
            });

            print("Luego de update");
            print(linksController.text);
            setState(() {
              recursos[recursoId] = {
                'nombre': nombreController.text,
                'descripcion': descripcionController,
                'links_relacionados': linksController,
                'autor': autorController.text,
              };
            });
            nombreController.clear();
            descripcionController.clear();
            linksController.clear();
            autorController.clear();
            Navigator.of(context).pop();
          },
          onTapLeft: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  int estadoBloque = 0;

  void cambiarEstado() {
    showDialog(
      context: context,
      builder: ((context) => AlertDialogWidget(
            message: 'Cambiar el estado del bloque',
            more: Column(
              children: [
                StateWidget(
                  large: true,
                  estado: 0,
                  onTap: () {
                    setState(() {
                      estadoBloque = 0;
                      FirebaseFirestore.instance
                          .collection('roadmap')
                          .doc(widget.roadId.toString())
                          .collection('bloques')
                          .doc(widget.blockId.toString())
                          .update({"estado": 0});
                    });
                    Navigator.of(context).pop();
                    setEstado(widget.roadId.toString());
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                StateWidget(
                  large: true,
                  estado: 1,
                  onTap: () {
                    setState(() {
                      FirebaseFirestore.instance
                          .collection('roadmap')
                          .doc(widget.roadId.toString())
                          .collection('bloques')
                          .doc(widget.blockId.toString())
                          .update({"estado": 1});
                      estadoBloque = 1;
                    });
                    Navigator.of(context).pop();
                    setEstado(widget.roadId.toString());
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                StateWidget(
                  large: true,
                  estado: 2,
                  onTap: () {
                    setState(() {
                      FirebaseFirestore.instance
                          .collection('roadmap')
                          .doc(widget.roadId.toString())
                          .collection('bloques')
                          .doc(widget.blockId.toString())
                          .update({"estado": 2});
                      estadoBloque = 2;
                    });

                    Navigator.of(context).pop();
                    setEstado(widget.roadId.toString());
                  },
                )
              ],
            ),
            rightText: 'Cancelar',
            onTapRight: () {
              Navigator.of(context).pop();
            },
          )),
    );
  }

  void borrarRecurso() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialogWidget(
        color: 2,
        message: '¿Estas seguro que deseas eliminar este recurso?',
        leftText: 'Eliminar',
        rightText: 'Cancelar',
        onTapLeft: () {
          //funcion para eliminar el recurso
        },
        onTapRight: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  void initState() {
    getListaRecursos();
    traerBloque(widget.roadId.toString(), widget.blockId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Editar recursos',
        type: 1,
        color: 2,
        onPressedLeading: () {
          Navigator.of(context).pop();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: colors.pinkColor.withOpacity(0.7),
        label: const Text('Agregar recurso', style: heading3bStyle),
        icon: const Icon(Icons.add),
        onPressed: () {
          agregarRecurso();
        },
      ),
      body: ReorderableListView(
        header: Column(children: [
          BoxText.tituloPagina(
              text: bloqueCreado['titulo'] ?? "cargando...",
              color: colors.pinkColor),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 24, right: 24),
            child: Text(
              bloqueCreado['descripcion'] ?? "cargando...",
              softWrap: true,
              textAlign: TextAlign.center,
              style: heading3Style.copyWith(color: Colors.black),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Estado:',
                    style: heading2bStyle.copyWith(color: colors.pinkColor)),
                StateWidget(
                  onTap: cambiarEstado,
                  estado: estadoBloque,
                  large: true,
                ),
              ],
            ),
          )
        ]),
        children: [
          for (final MapEntry<int, dynamic> tile in recursos.entries)
            Padding(
              key: ValueKey(tile),
              padding: const EdgeInsets.all(0),
              child: ResourceCard(
                  nombreRecurso: tile.value['nombre'],
                  edit: true,
                  onDelete: borrarRecurso,
                  autor: tile.value['autor'],
                  onTap: () {
                    editarRecurso(tile.key);
                  }),
            ),
        ],
        onReorder: (oldIndex, newIndex) {
          //updateMyTiles(oldIndex, newIndex);
        },
      ),
    );
  }
}
