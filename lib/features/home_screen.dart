import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static final gradients = AppGradients();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'RoadmapTo', type: 2),
      body: Column(children: [
        Text('soy el inicio'),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: gradients.infoGradient,
            ),
            child: Row(children: [
              Image(
                width: 73,
                height: 73,
                image: AssetImage('assets/images/profileImage.png')),
              Container( width: 24,height: 1,),
              Column(
                children: [
                  Text('holi', style: heading3bStyle.copyWith(color: Theme.of(context).primaryColor)),
                  Text('holi', style: interHeading3Style. copyWith(color: Theme.of(context).primaryColor)),
                  Text('holi', style: interHeading3Style),
                ],
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
