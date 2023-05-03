import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/resource_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:aristeia_app/core/widgets/state_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "No es posible abrir el url";
    }
  }

  void cambiarEstado() {
    showDialog(
      context: context,
      builder: ((context) => AlertDialogWidget(
            message: 'Cambiar el estado del bloque',
            more: Column(
              children: const [
                StateWidget(
                  large: true,
                  estado: 0,
                ),
                SizedBox(
                  height: 16,
                ),
                StateWidget(
                  large: true,
                  estado: 1,
                ),
                SizedBox(
                  height: 16,
                ),
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
  }

  void abrirRecurso() {
    showDialog(
      context: context,
      builder: ((context) => AlertDialogWidget(
            color: 2,
            tituloGeneral: false,
            tituloPersonalizado: Text('Información del recurso',
                textAlign: TextAlign.center,
                style: heading2bStyle.copyWith(color: colors.pinkColor)),
            more:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Descripción: ',
                        style:
                            heading3bStyle.copyWith(color: colors.pinkColor)),
                    TextSpan(
                        text: 'Soy la descripción del recurso',
                        style: heading3Style.copyWith(color: Colors.black)),
                  ])),
              const SizedBox(
                height: 8,
              ),
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Link: ',
                        style:
                            heading3bStyle.copyWith(color: colors.pinkColor)),
                    TextSpan(
                        text: 'url',
                        style: heading3Style.copyWith(
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchURL("www.lipsum.com");
                          }),
                  ])),
            ]),
            rightText: 'Cerrar',
            onTapRight: () {
              Navigator.of(context).pop();
            },
          )),
    );
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
                    onTap: cambiarEstado,
                    large: true,
                  ),
                ],
              ),
            ),
            for (var i = 0; i < 10; i++)
              ResourceCard(
                nombreRecurso: 'recurso $i',
                onTap: abrirRecurso,
              ),
          ],
        ),
      ),
    );
  }
}
