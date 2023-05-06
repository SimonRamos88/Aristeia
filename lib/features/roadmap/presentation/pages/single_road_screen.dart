import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/block_card.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/etiqueta_widget.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/input_field.dart';
import 'package:aristeia_app/core/widgets/pop_up_menu.dart';
import 'package:aristeia_app/core/widgets/state_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

@RoutePage()
class SingleRoadScreen extends StatefulWidget {
  final int roadId;
  late bool isMyRoadmap;

  SingleRoadScreen({
    Key? key,
    @PathParam() required this.roadId,
  }) : super(key: key);

  @override
  State<SingleRoadScreen> createState() => _SingleRoadScreenState();
}

class _SingleRoadScreenState extends State<SingleRoadScreen> {
  static final colors = AppColors();

  @override
  void initState() {
    widget.isMyRoadmap = context.router.currentPath.contains('personal');
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
                      onTapLeft: () {
                        context.router.pop();
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
            InputField(hintText: 'hintText', controller: TextEditingController())
          ],
        ),
        leftText: 'Crear',
        rightText: 'Cancelar',
        onTapLeft: (){},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        type: widget.isMyRoadmap? 3:1,
        color: 1,
        rightWidget: PopUpMenu(onTap1: editarRoadmap,onTap2: eliminarRoadmap,),
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
              text: 'Roadmap  ${widget.roadId}',
              color: colors.blueColor,
            ),
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
                      'Soy la descripción de la Roadmap sndfnsdf djfosidjfsjad ojosidjfosadj fnidfjisdjf ojdfihsdifuhs jfioujhd fsaf',
                      softWrap: true,
                      style: heading3Style.copyWith(color: Colors.black),
                    ),
                  ),
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
            widget.isMyRoadmap? Row(
              mainAxisAlignment: widget.isMyRoadmap? MainAxisAlignment.spaceBetween:MainAxisAlignment.start ,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Text('Estado:',
                          style:
                              heading2bStyle.copyWith(color: colors.blueColor)),
                      const SizedBox(
                        width: 4,
                      ),
                      StateWidget(
                        large: true,
                      ),
                    ],
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
            ): SizedBox(),
            for (var i = 0; i < 10; i++)
              BlockCard(
                nombreBloque: "Bloque ${i}",
                myRoadmap: widget.isMyRoadmap,
                onTap: () => context.router.navigate(
                  // BlockRouter()
                  SingleBlockRoute(
                    blockId: i,
                    roadId: widget.roadId,
                    isMyRoadmap: widget.isMyRoadmap,
                  ),
                ),
              ),
            const SizedBox(height: 24),
            widget.isMyRoadmap? SizedBox():Row(
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
          ],
        ),
      ),
    );
  }
}
