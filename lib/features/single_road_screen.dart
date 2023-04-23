import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/block_card.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/etiqueta.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/state_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SingleRoadScreen extends StatefulWidget {
  final int roadId;
  const SingleRoadScreen({
    Key? key,
    @PathParam() required this.roadId,
  }) : super(key: key);

  @override
  State<SingleRoadScreen> createState() => _SingleRoadScreenState();
}

class _SingleRoadScreenState extends State<SingleRoadScreen> {
  static final colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        type: 1,
        onPressedLeading: () {
          context.router.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BoxText.tituloPagina(
              text: 'Roadmap ${widget.roadId}',
              color: colors.blueColor,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Soy la descripción de la Roadmap'),
                  Row(
                    children: [
                      Icon(Icons.star_rounded,
                          size: 32, color: colors.blueColor),
                      Text(
                        '4,5',
                        style: heading2bStyle.copyWith(color: colors.blueColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Estado:',
                      style: heading2bStyle.copyWith(color: colors.blueColor)),
                  StateWidget(
                    large: true,
                  ),
                ],
              ),
            ),
            for (var i = 0; i < 10; i++)
              BlockCard(
                nombreBloque: "Bloque ${i}",
                onTap: () => context.router.navigate(
                  // BlockRouter()
                  SingleBlockRoute(blockId: i),
                ),
              ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyButton(
                  buttonText: 'copiar',
                  large: false,
                  outlined: true,
                  width: 130,
                  colorText: colors.mainColor,
                  onTap: () {
                      showDialog(
                        context: context,
                        builder: ((context) => AlertDialogWidget(
                              message: '¿Esta seguro de copiar este roadmap?',
                              leftText: 'Copiar',
                              rightText: 'Cancelar',
                              onTapLeft: () {},
                              onTapRight: () {
                                Navigator.of(context).pop();
                              },
                            )),
                      );
                    }),
      
                SizedBox(width: 24),
                MyButton(
                    buttonText: 'calificar',
                    large: false,
                    width: 130,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: ((context) => AlertDialogWidget(
                              message: 'Calificar',
                              leftText: 'Cerrar',
                              rightText: 'Cancelar',
                              onTapLeft: () {},
                              onTapRight: () {
                                Navigator.of(context).pop();
                              },
                            )),
                      );
                    }),
                    
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
