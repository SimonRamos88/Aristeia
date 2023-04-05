import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()    
class MyRoadmapsScreen extends StatelessWidget {
  const MyRoadmapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'RoadmapTo', type: 2),
      body: Container(child: Text('soy mis roadmaps'),),
    );;
  }
}