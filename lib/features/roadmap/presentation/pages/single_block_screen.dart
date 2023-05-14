import 'dart:developer';

import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/resource_card.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/change_resource_state.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/getEstado.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:aristeia_app/core/widgets/state_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/widgets/input_field.dart';
import '../../../Recurso/domain/repositories/addRecurso.dart';
import '../../../Recurso/domain/repositories/getRecurso.dart';
import '../../../Recurso/domain/repositories/getAllRecursos.dart';
import '../../../Recurso/domain/repositories/updateRecurso.dart';
import '../../domain/repositories/setEstado.dart';

@RoutePage()
class SingleBlockScreen extends StatefulWidget {
  final int blockId;
  final int roadId;
  final bool isMyRoadmap;

  const SingleBlockScreen({
    Key? key,
    @PathParam() required this.blockId,
    required this.roadId,
    required this.isMyRoadmap,
  }) : super(key: key);

  @override
  State<SingleBlockScreen> createState() => _SingleBlockScreenState();
}

class _SingleBlockScreenState extends State<SingleBlockScreen> {
  static final colors = AppColors();
  bool isMyRoad = false;
  final Map<int, Map<String, dynamic>> recursos = {};

  Future<void> _launchURL(String url) async {
    var uri = Uri.parse(url);

    if (url.contains('/')) {
      uri = Uri.parse(url);
    } else {
      uri = Uri(scheme: "https", host: url);
    }

    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      print(e);
      context.showFlash<bool>(
        barrierDismissible: true,
        duration: const Duration(seconds: 5),
        builder: (context, controller) => FlashBar(
          controller: controller,
          forwardAnimationCurve: Curves.easeInCirc,
          reverseAnimationCurve: Curves.bounceIn,
          position: FlashPosition.bottom,
          indicatorColor: Theme.of(context).primaryColor,
          icon: const Icon(Icons.dangerous, color: Colors.red),
          //title: const Text('Flash Title'),
          content: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'No es posible acceder a este link',
                textAlign: TextAlign.center,
                style: heading3bStyle,
              )),
        ),
      );
    }
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

  getListaRecursos() async {
    List listaRecursos =
        await getRecursos(widget.roadId.toString(), widget.blockId.toString());
    for (final e in listaRecursos) {
      //log("log: " + e['nombre'] + e.id);
      int keyR = int.parse(e.id);
      recursos[keyR] = e.data() as Map<String, dynamic>;
    }
  }

  void abrirRecurso(String nombre, String descripcion, List links) {
    showDialog(
      context: context,
      builder: ((context) => AlertDialogWidget(
            color: 2,
            tituloGeneral: false,
            tituloPersonalizado: Text(nombre,
                textAlign: TextAlign.center,
                style: heading2bStyle.copyWith(color: colors.pinkColor)),
            more: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Descripción: ',
                      style: heading3bStyle.copyWith(color: colors.pinkColor)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(descripcion,
                      style: heading3Style.copyWith(color: Colors.black)),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Links: ',
                          style:
                              heading3bStyle.copyWith(color: colors.pinkColor)),
                      const SizedBox(
                        height: 5,
                      ),
                      for (final e in links)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 7, top: 7),
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(children: [
                              WidgetSpan(
                                child: Icon(
                                  Icons.link,
                                  color: colors.pinkColor,
                                ),
                              ),
                              TextSpan(
                                text: e,
                                style: heading3Style.copyWith(
                                    fontSize: 20,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchURL(e);
                                  },
                              ),
                            ]),
                          ),
                        ),
                      const SizedBox(
                        height: 5,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Autores: ',
                            style: heading3bStyle.copyWith(
                              color: colors.pinkColor,
                            ),
                          ),
                          TextSpan(
                            text: descripcion,
                            style: heading3Style.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ]),
            rightText: 'Cerrar',
            onTapRight: () {
              Navigator.of(context).pop();
            },
          )),
    );
  }

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
    });
    await getEstado(widget.roadId.toString());
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
        type: 1,
        color: 2,
        onPressedLeading: () {
          context.router.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BoxText.tituloPagina(
              text: bloqueCreado["titulo"] ?? "cargando",
              color: colors.pinkColor,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 24, right: 24),
              child: Text(
                bloqueCreado["descripcion"] ?? "cargando",
                softWrap: true,
                textAlign: TextAlign.center,
                style: heading3Style.copyWith(color: Colors.black),
              ),
            ),
            widget.isMyRoadmap
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Estado:',
                            style: heading2bStyle.copyWith(
                                color: colors.pinkColor)),
                        StateWidget(
                          onTap: cambiarEstado,
                          estado: estadoBloque,
                          large: true,
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            for (final MapEntry<int, dynamic> tile in recursos.entries)
              Padding(
                key: ValueKey(tile),
                padding: const EdgeInsets.all(0),
                child: ResourceCard(
                    nombreRecurso: tile.value['nombre'],
                    edit: true,
                    onDelete: borrarRecurso,
                    onTap: () {
                      abrirRecurso(
                          tile.value["nombre"],
                          tile.value['descripcion'],
                          tile.value['links_relacionados']);
                    }),
              ),
          ],
        ),
      ),
    );
  }
}
