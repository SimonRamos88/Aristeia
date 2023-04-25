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
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

@RoutePage()
class Create2Screen extends StatefulWidget {
  static final gradients = AppGradients();
  static final colors = AppColors();

  const Create2Screen({super.key});

  @override
  State<Create2Screen> createState() => _Create2ScreenState();
}

class _Create2ScreenState extends State<Create2Screen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Crear roadmap', type: 1, onPressedLeading: (){context.router.pop();},),
      body: ReorderableListView(
        
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
              child: BlockCard(nombreBloque: tile.toString(), edit:true) ,
            ),
        ],
        onReorder: (oldIndex, newIndex) {
          updateMyTiles(oldIndex, newIndex);
        },
      ),
    );
  }

}
