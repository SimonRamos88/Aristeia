import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/features/roadmap/domain/repositories/getRoadmapPublico.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PublicRoadmapsScreen extends StatelessWidget {
  const PublicRoadmapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Comunidad', type: 0),
      body: getRoadmapPublico(),
    );
  }
}
