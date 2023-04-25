import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/resource_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:aristeia_app/core/widgets/state_widget.dart';

@RoutePage()
class SingleBlockScreen extends StatefulWidget {
  final int blockId;
  const SingleBlockScreen({
    Key? key,
    @PathParam() required this.blockId,
  }) : super(key: key);

  @override
  State<SingleBlockScreen> createState() => _SingleBlockScreenState();
}

class _SingleBlockScreenState extends State<SingleBlockScreen> {
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
          children: [
            BoxText.tituloPagina(
              text: 'Bloque ${widget.blockId}',
              color: colors.pinkColor,
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
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: ((context) => AlertDialogWidget(
                              message: 'Cambiar el estado del bloque',
                              more: Column(
                                children: [
                                  StateWidget(
                                    large: true,
                                    estado: 0,
                                  ),
                                  SizedBox(height: 16,),
                                  StateWidget(
                                    large: true,
                                    estado: 1,
                                  ),
                                  SizedBox(height: 16,),
                                  StateWidget(
                                    large: true,
                                    estado: 2,
                                  )
                                ],
                              ),
                              rightText: 'Cancelar',
                              onTapRight: () {
                                Navigator.of(context).pop();
                              },
                            )),
                      );
                    },
                    large: true,
                  ),
                ],
              ),
            ),
            for (var i = 0; i < 10; i++)
              ResourceCard(
                nombreRecurso: 'recurso $i',
              ),
          ],
        ),
      ),
    );
  }
}
