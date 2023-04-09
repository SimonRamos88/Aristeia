import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/roadmap_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()    
class MyRoadmapsScreen extends StatelessWidget {
  const MyRoadmapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Mis roadmaps', type: 2),
      body: Column(
        children: [Text('soy mis roadmaps'),
        RoadmapCard(),
        ]),
    );;
  }
}