import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
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
        onPressedAction:(){context.router.replace(const WelcomeRouter());} ,
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: gradients.infoGradient,
               boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(31, 35, 9, 39), // shadow color
                    blurRadius: 4, // shadow radius
                    offset: Offset(0, 4), // shadow offset
                    spreadRadius:
                        0, // The amount the box should be inflated prior to applying the blur
                    blurStyle: BlurStyle.normal // set blur style
                    ),
              ],
            ),
            child: Row(children: [
              const Image(
                width: 73,
                height: 73,
                image: AssetImage('assets/images/profileImage.png')),
              const SizedBox( width: 24,height: 1,),
              SizedBox(
                height: 73,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Joramos', style: heading2bStyle.copyWith(color: Theme.of(context).primaryColor)),
                    Text('Jose Simón Ramos', style: interHeading3Style. copyWith(color: Theme.of(context).primaryColor)),
                    Text('joramos@unal.edu.co', style: interHeading3Style),
                  ],
                ),
              ),
            ]),
          ),
        ),
        BoxText.section(text: 'Mis estadísticas:', centered: false, color: Theme.of(context).primaryColor,),
        Row(children: [
          Text('INFO'),
        ],),
        BoxText.section(text: 'Roadmaps culminados:', centered: false, color: Theme.of(context).primaryColor),
        Row(children: [
          Text('INFO'),
        ],),
      ]),
    );
  }
}
