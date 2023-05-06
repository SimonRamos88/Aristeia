import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/getRoadmapPrivado.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyRoadmapsScreen extends StatelessWidget {
  const MyRoadmapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Mis roadmaps', type: 0),
      body: getRoadmapPrivado(),
    );
  }
}
