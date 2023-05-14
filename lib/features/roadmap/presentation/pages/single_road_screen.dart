import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/etiqueta_widget.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:aristeia_app/core/widgets/pop_up_menu.dart';
import 'package:aristeia_app/core/widgets/state_widget.dart';
import 'package:aristeia_app/features/autenticacion/presentation/pages/terms_screen.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/delete_roadmap.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/get_bloque_road.dart';
import 'package:aristeia_app/core/widgets/filter__chips_data.dart';
import 'package:aristeia_app/core/widgets/filter_chips.dart';
import 'package:aristeia_app/features/roadmap/presentation/pages/create_roadmap_screen.dart';
import 'package:aristeia_app/features/roadmap/presentation/pages/edit_roadmap_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../core/network/auth.dart';
import '../../../../core/widgets/date_picker.dart';

@RoutePage()
class SingleRoadScreen extends StatefulWidget {
  final int roadId;
  SingleRoadScreen({
    Key? key,
    @PathParam() required this.roadId,
  }) : super(key: key);

  @override
  State<SingleRoadScreen> createState() => _SingleRoadScreenState();
}

class _SingleRoadScreenState extends State<SingleRoadScreen> {
  static final colors = AppColors();
  Map<String, dynamic> roadmapCreado = {};
  bool isMyRoad = false;
  int estadoRoad = 0;
  @override
  void initState() {
    traerRoadmap();
    isMyRoad = context.router.currentPath.contains('personal');
    super.initState();
  }

  void calificarRoadmap() {
    showDialog(
      context: context,
      builder: ((context) => AlertDialogWidget(
          message: 'Califica este Roadmap de 1 a 5 estrellas',
          rightText: 'Calificar',
          leftText: 'Cancelar',
          color: 1,
          onTapRight: () {},
          onTapLeft: () {
            Navigator.of(context).pop();
          },
          more: RatingBar.builder(
            glow: false,
            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star_rounded,
              color: Theme.of(context).primaryColor,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ))),
    );
  }

  void copiarRoadmap() {
    showDialog(
      context: context,
      builder: ((context) => AlertDialogWidget(
            message: '¿Estas seguro de copiar este Roadmap?',
            color: 1,
            leftText: 'Copiar',
            rightText: 'Cancelar',
            onTapLeft: () {},
            onTapRight: () {
              Navigator.of(context).pop();
            },
          )),
    );
  }

  void eliminarRoadmap() {
    showDialog(
      context: context,
      builder: ((context) => AlertDialogWidget(
            color: 1,
            message: '¿Estas seguro de eliminar este roadmap?',
            leftText: 'Eliminar',
            rightText: 'Cancelar',
            onTapLeft: () async {
              await deleteRoadbyId(widget.roadId.toString());
              // ignore: use_build_context_synchronously
              context.router.pop();
              context.router.navigateNamed('/logged/personal');
              context.showFlash<bool>(
                barrierDismissible: true,
                duration: const Duration(seconds: 5),
                builder: (context, controller) => FlashBar(
                  controller: controller,
                  forwardAnimationCurve: Curves.easeInCirc,
                  reverseAnimationCurve: Curves.bounceIn,
                  position: FlashPosition.bottom,
                  indicatorColor: Theme.of(context).primaryColor,
                  icon: const Icon(Icons.check),
                  //title: const Text('Flash Title'),
                  content: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Roadmap eliminado exitosamente',
                        textAlign: TextAlign.center,
                        style: heading3bStyle,
                      )),
                ),
              );
            },
            onTapRight: () {
              Navigator.of(context).pop();
            },
          )),
    );
  }

  void editarRoadmap() {
    context.router.navigateNamed(
      ('/logged/editar/1'),
    );
  }

  Future<void> editarRoadma() async {
    TextEditingController nombreRoadmap = TextEditingController();
    TextEditingController descripcion = TextEditingController();
    TextEditingController tipo_roadmap = TextEditingController();
    TextEditingController fechaInicio = TextEditingController();
    List<FilterChipData> filterChips = [];
    List<String> etiquetas = [];
    List<String> idEtiquetas = [];
    await getFilterChipsFromFirestore().then((chips) {
      setState(() {
        filterChips = chips;
      });
      print(chips);
    });
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialogWidget(
        tituloGeneral: false,
        color: 1,
        tituloPersonalizado: Text(
          'Editar Roadmap',
          style: heading2bStyle.copyWith(color: colors.blueColor),
          textAlign: TextAlign.center,
        ),
        //message: 'Si te sales sin guardar perderas toda la información del bloque',
        more: Column(
          children: [
            InputField(hintText: 'Nombre', controller: nombreRoadmap),
            InputField(hintText: 'Descripcion', controller: descripcion),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  value: '1',
                  child: Text(
                    'Público',
                  ),
                ),
                DropdownMenuItem(
                  value: '2',
                  child: Text('Privado'),
                )
              ],
              onChanged: (value) {
                //print(value);
                tipo_roadmap.text = value.toString();
              },
              focusColor: Colors.transparent,
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(30),
              style: interHeading3Style.copyWith(color: Colors.black),
              decoration: InputDecoration(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                labelText: 'Tipo de roadmap',
                labelStyle: heading3bStyle.copyWith(
                    backgroundColor: CreateRoadmapScreen.colors.backgroundColor,
                    color: Theme.of(context).primaryColor),
                floatingLabelStyle: heading2bStyle.copyWith(
                    backgroundColor: CreateRoadmapScreen.colors.backgroundColor,
                    color: Theme.of(context).primaryColor),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.5, style: BorderStyle.none),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Colors.transparent),
                ),
              ),
            ),
            DatePicker(
              hintText: "Fecha Inicio",
              controller: fechaInicio,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: BoxText.section(
                  text: 'Etiquetas',
                  centered: false,
                  color: Theme.of(context).primaryColor),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: buildFilterChips(filterChips, etiquetas, idEtiquetas),
            ),
          ],
        ),
        leftText: 'Aceptar',
        rightText: 'Cancelar',
        onTapLeft: () async {
          print(widget.roadId);
          FirebaseFirestore db = FirebaseFirestore.instance;
          if (!nombreRoadmap.text.trim().isEmpty) {
            db.collection('roadmap').doc(widget.roadId.toString()).update({"nombre": nombreRoadmap.text.trim()});
          }
          if (!descripcion.text.isEmpty) {
            db.collection('roadmap').doc(widget.roadId.toString()).update({"descripcion": descripcion.text.trim()});
          }
          if (!fechaInicio.text.isEmpty) {
            db.collection('roadmap').doc(widget.roadId.toString()).update({"fechaInicio": fechaInicio.text.trim()});
          }
          if (!tipo_roadmap.text.isEmpty) {
            if (tipo_roadmap.text.trim() == '1') {
              db.collection('roadmap').doc(widget.roadId.toString()).update({"publico": true});
            } else {
              db.collection('roadmap').doc(widget.roadId.toString()).update({"publico": false});
            }
          }
          if (!etiquetas.isEmpty) {
            db.collection('roadmap').doc(widget.roadId.toString()).update({"etiquetas": etiquetas});
          }
          print("Todo realizado con Exito");
          traerRoadmap();
        },
        onTapRight: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget buildFilterChips(List<FilterChipData> filterChips,
          List<String> etiquetas, List<String> idEtiquetas) =>
      Wrap(
        runSpacing: 3,
        spacing: 3,
        alignment: WrapAlignment.center,
        children: filterChips
            .map((filterChip) => FilterChip(
                  label: Text(
                    filterChip.label,
                    style: heading3bStyle,
                  ),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: filterChip.color,
                  ),
                  backgroundColor: filterChip.color.withOpacity(0.1),
                  onSelected: (isSelected) {
                    setState(() {
                      filterChips = filterChips.map((otherChip) {
                        return filterChip == otherChip
                            ? otherChip.copy(isSelected: isSelected)
                            : otherChip;
                      }).toList();
                    });
                    print(filterChip.isSelected);
                    if (filterChip.isSelected == false) {
                      etiquetas.add(filterChip.label);
                      idEtiquetas.add(filterChip.id);
                    } else {
                      if (etiquetas.contains(filterChip.label)) {
                        etiquetas.remove(filterChip.label);
                        idEtiquetas.remove(filterChip.id);
                      }
                    }
                    print(etiquetas);
                  },
                  selected: filterChip.isSelected,
                  checkmarkColor: filterChip.color,
                  selectedColor: filterChip.color.withOpacity(0.25),
                ))
            .toList(),
      );

  void editarBloques() {
    showDialog(
      context: context,
      builder: ((context) => AlertDialogWidget(
            message: '¿Estas seguro de editar los bloques de este Roadmap?',
            color: 1,
            leftText: 'Confirmar',
            rightText: 'Cancelar',
            onTapLeft: () {
              context.router.push(CreateBlockRoute(roadId: widget.roadId));
            },
            onTapRight: () {
              Navigator.of(context).pop();
            },
          )),
    );
  }

  Future<void> traerRoadmap() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    //instanciamos la db y buscamos la coleccion
    CollectionReference collectionReferenceRoadmap = db.collection('roadmap');
    //antes que nada, verificamos que la informacion esté correcta
    DocumentSnapshot query =
        await collectionReferenceRoadmap.doc(widget.roadId.toString()).get();
    setState(() {
      roadmapCreado = query.data() as Map<String, dynamic>;
      estadoRoad =
          roadmapCreado["estado"] == null ? 1 : roadmapCreado["estado"];

      /*
      if (roadmapCreado["creador"] == Auth().currentUser!.uid) {
        //widget.isMyRoadmap = true;
      }
      */
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        type: isMyRoad ? 3 : 1,
        color: 1,
        rightWidget: PopUpMenu(
          onTap1: () {
            context.router.push(EditRoadmapRoute(roadId: widget.roadId));
          },
          onTap2: editarBloques,
          onTap3: eliminarRoadmap,
        ),
        onPressedLeading: () {
          context.router.pop();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BoxText.tituloPagina(
            text: roadmapCreado["nombre"] ?? "cargando...",
            color: colors.blueColor,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                if (roadmapCreado['etiquetas'] != null)
                  for (final etiqueta in roadmapCreado['etiquetas'])
                    Etiqueta.large(
                      text: etiqueta ?? "cargando...",
                      color: 1,
                    ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    roadmapCreado["descripcion"] ?? "cargando...",
                    softWrap: true,
                    style: heading3Style.copyWith(color: Colors.black),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star_rounded, size: 32, color: colors.blueColor),
                    Text(
                      '4,5',
                      style: heading2bStyle.copyWith(color: colors.blueColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          isMyRoad
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Estado:',
                              style: heading2bStyle.copyWith(
                                  color: colors.blueColor)),
                          const SizedBox(
                            width: 4,
                          ),
                          StateWidget(
                            estado: estadoRoad,
                            large: true,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Tipo:',
                              style: heading3bStyle.copyWith(
                                  color: colors.blueColor)),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                              //roadmapCreado["publico"] ? ?? "cargando...",
                              roadmapCreado["publico"] == null
                                  ? "..."
                                  : roadmapCreado["publico"]
                                      ? "Público"
                                      : "Privado",
                              style:
                                  heading3Style.copyWith(color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox(),

          // Función para mostrar bloques
          BloqueRoad(
            roadmapId: widget.roadId.toString(),
            isMyRoad: isMyRoad,
            nav: true,
          ),

          isMyRoad ? const SizedBox() : const SizedBox(height: 24),
          isMyRoad
              ? const SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyButton(
                        buttonText: 'copiar',
                        blue: true,
                        large: false,
                        outlined: true,
                        width: 130,
                        onTap: copiarRoadmap),
                    const SizedBox(width: 24),
                    MyButton(
                      buttonText: 'calificar',
                      blue: true,
                      large: false,
                      width: 130,
                      onTap: calificarRoadmap,
                    ),
                  ],
                ),
          const SizedBox(height: 24),
          isMyRoad ? const SizedBox() : const SizedBox(height: 24),
        ],
      ),
    );
  }
}
