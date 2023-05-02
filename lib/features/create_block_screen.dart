import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/block_card.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/filter__chips_data.dart';
import 'package:aristeia_app/core/widgets/filter_chips.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:aristeia_app/core/widgets/resource_card.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/addBloque.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

@RoutePage()
class CreateBlockScreen extends StatefulWidget {
  static final gradients = AppGradients();
  static final colors = AppColors();

  const CreateBlockScreen({super.key});

  @override
  State<CreateBlockScreen> createState() => _CreateBlockScreenState();
}

class _CreateBlockScreenState extends State<CreateBlockScreen> {
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

  final TextEditingController _controllerDescripcion = TextEditingController();
  final TextEditingController _controllerFechaFin = TextEditingController();
  final TextEditingController _controllerFechaInicio = TextEditingController();
  final TextEditingController _controllerTitulo = TextEditingController();
  final TextEditingController _controllerImportancia = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Crear Bloque',
        type: 1,
        onPressedLeading: () {
          context.router.pop();
        },
      ),
      body: Center(
        child:
            /*
            ReorderableListView(
              children: [
                for (final tile in myTiles)
                  Padding(
                    key: ValueKey(tile),
                    padding: const EdgeInsets.all(0),
                    // child: Container(
                    //   color: Colors.grey[200],
                    //   child: ListTile(
                    //     title: Text(tile.toString()),
                    //   ),
                    // ),
                    child:
                        ResourceCard(nombreRecurso: tile.toString(), edit: true),
                  ),
              ],
              onReorder: (oldIndex, newIndex) {
                updateMyTiles(oldIndex, newIndex);
              },
            ),
            */
            SingleChildScrollView(
          child: Column(
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
        ),
      ),
    );
  }
}
