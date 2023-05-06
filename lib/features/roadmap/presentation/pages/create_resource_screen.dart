import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';

import 'package:aristeia_app/core/widgets/resource_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../../core/widgets/box_text.dart';

@RoutePage()
class CreateResourceScreen extends StatefulWidget {
  static final gradients = AppGradients();

  final int blockId;

  const CreateResourceScreen({
    super.key,
    @PathParam() required this.blockId,
  });

  @override
  State<CreateResourceScreen> createState() => _CreateResourceScreenState();
}

class _CreateResourceScreenState extends State<CreateResourceScreen> {
  final colors = AppColors();

  // list of tiles
  final List myTiles = [
    'A',
    'B',
    'C',
    'D',
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

  void agregarRecurso() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialogWidget(
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
                hintText: 'Nombre recurso',
                controller: TextEditingController()),
            InputField(
                hintText: 'Descripción',
                maxLines: 3,
                controller: TextEditingController()),
            InputField(
                hintText: 'Links',
                maxLines: 2,
                controller: TextEditingController()),
          ],
        ),
        rightText: 'Agregar',
        leftText: 'Cancelar',
        onTapRight: () {
          Navigator.of(context).pop();
        },
        onTapLeft: () {
          Navigator.of(context).pop();
        },
      ),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Crear bloque',
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
        onPressed: agregarRecurso,
      ),
      body: ReorderableListView(
        header: Column(children: [
          BoxText.tituloPagina(
              text: 'Nombre del Bloque', color: colors.pinkColor),
              Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                'Soy la descripción de la Roadmap sndfnsdf djfosidjfsjad ojosidjfosadj fnidfjisdjf ojdfihsdifuhs jfioujhd fsaf',
                softWrap: true,
                textAlign: TextAlign.center,
                style: heading3Style.copyWith(color: Colors.black),
              ),
            ),
        ]),
        children: [
          for (final tile in myTiles)
            Padding(
              key: ValueKey(tile),
              padding: const EdgeInsets.all(0),
              child: ResourceCard(
                nombreRecurso: tile.toString(),
                edit: true,
                onDelete: borrarRecurso,
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
