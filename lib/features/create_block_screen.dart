import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/block_card.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/etiqueta_widget.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:aristeia_app/core/widgets/resource_card.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/createBloque.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// Esta es la pagina para ver las listads de los bloques creados

@RoutePage()
class CreateBlockScreen extends StatefulWidget {
  static final gradients = AppGradients();
  static final colors = AppColors();

  const CreateBlockScreen({super.key});

  @override
  State<CreateBlockScreen> createState() => _CreateBlockScreenState();
}

class _CreateBlockScreenState extends State<CreateBlockScreen> {
  final colors = AppColors();
  // list of tiles

  final List myTiles = [
    'Nombre del bloque',
  ];

  // reorder method
  void updateMyTiles(int oldIndex, int newIndex) {
    setState(() {
      // this adjustment is needed when moving down the list
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }

      // get the tile we are moving
      final String tile = myTiles.removeAt(oldIndex);
      // place the tile in new position
      myTiles.insert(newIndex, tile);
    });
  }

  void agregarBloque() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialogWidget(
        tituloGeneral: false,
        color: 1,
        tituloPersonalizado: Text(
          'Crear bloque',
          style: heading2bStyle.copyWith(color: colors.blueColor),
          textAlign: TextAlign.center,
        ),
        //message: 'Si te sales sin guardar perderas toda la información del bloque',
        more: Column(
            children: [
              InputField(
                  hintText: 'Titulo bloque', controller: _controllerTitulo),
              InputField(
                hintText: 'Descripcion',
                controller: _controllerDescripcion,
              ),
              InputField(
                  hintText: 'Importancia (1-5)',
                  controller: _controllerImportancia),
              InputField(
                  hintText: 'Fecha inicio (YYYY-MM-DD)',
                  controller: _controllerFechaInicio),
              InputField(
                hintText: 'Fecha fin (YYYY-MM-DD)',
                controller: _controllerFechaFin,
              ),
              MyButton(
                buttonText: "Crear Bloque",
                onTap: () async {
                  await addBlock(
                      '1',
                      _controllerTitulo.text,
                      _controllerDescripcion.text,
                      int.parse(_controllerImportancia.text),
                      DateTime.parse(
                          _controllerFechaInicio.text + ' 00:00:00.000'),
                      DateTime.parse(
                          _controllerFechaFin.text + ' 00:00:00.000'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        leftText: 'Crear',
        rightText: 'Cancelar',
        onTapLeft: () {
          Navigator.of(context).pop();
          context.router.navigateNamed(
            ('/logged/crear/1'),
          );
        },
        onTapRight: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void eliminarBloque() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialogWidget(
        color: 1,
        message: '¿Estas seguro que deseas eliminar este bloque?',
        leftText: 'Eliminar',
        rightText: 'Cancelar',
        onTapLeft: () {
          //funcion para eliminar el bloque
        },
        onTapRight: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
  final TextEditingController _controllerDescripcion = TextEditingController();
  final TextEditingController _controllerFechaFin = TextEditingController();
  final TextEditingController _controllerFechaInicio = TextEditingController();
  final TextEditingController _controllerTitulo = TextEditingController();
  final TextEditingController _controllerImportancia = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Crear bloques',
        type: 1,
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
      body: ReorderableListView(
        header: Column(children: [
          BoxText.tituloPagina(
              text: 'Nombre del Roadmap', color: colors.blueColor),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                for (var i = 0; i < 5; i++)
                  Etiqueta.large(
                    text: 'etiqueta ${i}',
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
                    'Hola soy la descripción del roadmap',
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
                      Text('Público',
                          style: heading3Style.copyWith(color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Arrastra los bloques para ordenarlos',
            style: bodyStyle.copyWith(color: colors.blueColor),
          ),
        ]),
        footer: Column(children: const [
          MyButton(
            buttonText: 'Terminar roadmap',
            blue: true,
          ),
          SizedBox(height: 70),
        ]),
        children: [
          for (final tile in myTiles)
            Padding(
              key: ValueKey(tile),
              padding: const EdgeInsets.all(0),
              child: BlockCard(
                nombreBloque: tile.toString(),
                edit: true,
                onDelete: eliminarBloque,
                onTap: () {
                  context.router.navigateNamed(
                    ('/logged/crear/1'),
                  );
                },
              ),
            ),
        ],
        onReorder: (oldIndex, newIndex) {
          updateMyTiles(oldIndex, newIndex);
        },
      ),
    );
  }
}
