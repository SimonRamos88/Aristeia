import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/block_card.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/date_picker.dart';
import 'package:aristeia_app/core/widgets/etiqueta_widget.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:aristeia_app/core/widgets/resource_card.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/create_bloque.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/delete_bloque.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/get_bloque_road.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/get_roadmap.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

// Esta es la pagina para ver las listads de los bloques creados

@RoutePage()
class CreateBlockScreen extends StatefulWidget {
  static final gradients = AppGradients();
  static final colors = AppColors();
  final int roadId;

  const CreateBlockScreen({
    super.key,
    @PathParam() required this.roadId,
  });

  @override
  State<CreateBlockScreen> createState() => _CreateBlockScreenState();
}

class _CreateBlockScreenState extends State<CreateBlockScreen> {
  final colors = AppColors();

  final TextEditingController _controllerDescripcion = TextEditingController();
  final TextEditingController _controllerFechaFin = TextEditingController();
  final TextEditingController _controllerFechaInicio = TextEditingController();
  final TextEditingController _controllerTitulo = TextEditingController();
  final TextEditingController _controllerImportancia = TextEditingController();

  Map<String, dynamic> roadmapCreado = {};

  void agregarBloque() {
    print(widget.roadId);
    showDialog(
      context: context,
      builder: (BuildContext context) => SingleChildScrollView(
        child: AlertDialogWidget(
          insetPadding: true,
          width: MediaQuery.of(context).size.width,
          tituloGeneral: false,
          color: 1,
          tituloPersonalizado: Text(
            'Crear bloque',
            style: heading2bStyle.copyWith(color: colors.blueColor),
            textAlign: TextAlign.center,
          ),
          //message: 'Si te sales sin guardar perderas toda la información del bloque',
          more: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InputField(
                      hintText: 'Titulo bloque', controller: _controllerTitulo),
                  InputField(
                    hintText: 'Descripcion',
                    maxLines: 2,
                    controller: _controllerDescripcion,
                  ),
                  InputField(
                      hintText: 'Importancia (1-5)',
                      controller: _controllerImportancia),
                  DatePicker(
                      hintText: "fecha inicial",
                      controller: _controllerFechaInicio),
                  DatePicker(
                    hintText: 'fecha final',
                    controller: _controllerFechaFin,
                  ),
                ],
              ),
            ),
          ),

          leftText: 'Crear',
          rightText: 'Cancelar',
          onTapLeft: () async {
            DateTime f_inicio = DateTime.parse(_controllerFechaInicio.text);
            DateTime f_final = DateTime.parse(_controllerFechaFin.text);
            if (_controllerTitulo.text != '' &&
                    _controllerDescripcion.text != '' &&
                    _controllerFechaFin.text != '' &&
                    _controllerFechaInicio.text != '' &&
                    int.parse(_controllerImportancia.text) < 6 &&
                    int.parse(_controllerImportancia.text) > 0 &&
                    f_inicio.compareTo(f_final) < 0 ||
                f_inicio.compareTo(f_final) == 0) {
              String bloqueId = await addBlock(
                  widget.roadId.toString(),
                  _controllerTitulo.text,
                  _controllerDescripcion.text,
                  int.parse(_controllerImportancia.text),
                  f_inicio,
                  f_final);
              Navigator.of(context).pop();
              //borrar los controllers:
              _controllerTitulo.clear();
              _controllerDescripcion.clear();
              _controllerImportancia.clear();
              _controllerFechaInicio.clear();
              _controllerFechaFin.clear();
            } else {
              //esto muestra un flash, que es como un snackbar para decir que faltan datos
              context.showFlash<bool>(
                barrierDismissible: true,
                duration: const Duration(seconds: 5),
                builder: (context, controller) => FlashBar(
                  controller: controller,
                  forwardAnimationCurve: Curves.easeInCirc,
                  reverseAnimationCurve: Curves.bounceIn,
                  position: FlashPosition.bottom,
                  indicatorColor: Theme.of(context).primaryColor,
                  icon: const Icon(Icons.dangerous_rounded),
                  //title: const Text('Flash Title'),
                  content: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Algun dato no ha sido llenado correctamente',
                        textAlign: TextAlign.center,
                        style: heading3bStyle,
                      )),
                ),
              );
            }
          },
          onTapRight: () {
            _controllerTitulo.clear();
            _controllerDescripcion.clear();
            _controllerImportancia.clear();
            _controllerFechaInicio.clear();
            _controllerFechaFin.clear();
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  Future<void> traerRoadmap() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    //instanciamos la db y buscamos la coleccion
    CollectionReference collectionReferenceRoadmap = db.collection('roadmap');
    //antes que nada, verificamos que la informacion esté correcta
    DocumentSnapshot query =
        await collectionReferenceRoadmap.doc(widget.roadId.toString()).get();
    print("existo");
    setState(() {
      roadmapCreado = query.data() as Map<String, dynamic>;
      print(roadmapCreado);
    });
  }

  @override
  void initState() {
    traerRoadmap();
    print(roadmapCreado);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(
        title: 'Editar bloques',
        type: 0,
        color: 1,
        onPressedLeading: () {
          context.router.pop();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: colors.blueColor.withOpacity(0.7),
        label: const Text('Agregar bloque', style: heading3bStyle),
        icon: const Icon(Icons.add),
        onPressed: agregarBloque,
      ),
      body: Column(children: [
        BoxText.tituloPagina(
            text: roadmapCreado['nombre'] == null
                ? "cargando"
                : roadmapCreado['nombre'],
            color: colors.blueColor),
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
                    text: etiqueta == null ? "cargando..." : etiqueta,
                    color: 1,
                  ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  roadmapCreado['descripcion'] == null
                      ? "cargando..."
                      : roadmapCreado['descripcion'],
                  style: heading3Style,
                  softWrap: true,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Tipo:',
                        style:
                            heading3bStyle.copyWith(color: colors.blueColor)),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                        roadmapCreado['publico'] == null
                            ? "cargando..."
                            : roadmapCreado['publico']
                                ? "Publico"
                                : "Privado",
                        style: heading3Style.copyWith(color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Función para mostrar bloques
        BloqueRoad(
          edit: true,
          isMyRoad: true,
          nav: false, // Mostrar bloques para la pagina create roadmap
          roadmapId: widget.roadId.toString(),
        ),

        MyButton(
          buttonText: 'Terminar roadmap',
          blue: true,
          onTap: () {
            context.router.navigateNamed(
              ('/logged/crear'),
            );
            context.router.navigateNamed(
              ('/logged/personal'),
            );
          },
        ),
        SizedBox(height: 70),
      ]),
    );
  }
}

// onTap: () {
//                 context.router.navigateNamed(
//                   ('/logged/crear/' + widget.roadId.toString()),
//                 );
//               },