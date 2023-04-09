import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/info_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static final gradients = AppGradients();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'RoadmapTo',
        type: 2,
        onPressedAction: () {
          context.router.replace(const WelcomeRouter());
        },
      ),
      body: Column(children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: InfoCard(
              child: Row(children: [
                const Image(
                    width: 73,
                    height: 73,
                    image: AssetImage('assets/images/profileImage.png')),
                const SizedBox(
                  width: 24,
                  height: 1,
                ),
                SizedBox(
                  height: 73,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Joramos',
                          style: heading2bStyle.copyWith(
                              color: Theme.of(context).primaryColor)),
                      Text('Jose Simón Ramos',
                          style: interHeading3Style.copyWith(
                              color: Theme.of(context).primaryColor)),
                      Text('joramos@unal.edu.co', style: interHeading3Style),
                    ],
                  ),
                ),
              ]),
            )),
        BoxText.section(
          text: 'Mis estadísticas:',
          centered: false,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  'Tiempo dedicado a RoadmapTo esta semana:',
                  textAlign: TextAlign.center,
                  style: heading3bStyle.copyWith(
                      color: Theme.of(context).primaryColor),
                )),
            InfoCard(
              child: Text(
                '24 horas 30 minutos',
                style: interHeading3Style,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        BoxText.section(
            text: 'Roadmaps culminados:',
            centered: false,
            color: Theme.of(context).primaryColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  'Este mes has completado:',
                  textAlign: TextAlign.center,
                  style: heading3bStyle.copyWith(
                      color: Theme.of(context).primaryColor),
                )),
            InfoCard(
              child: Text(
                '20 bloques y 2 roadmaps',
                style: interHeading3Style,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
