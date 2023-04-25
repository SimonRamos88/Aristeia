import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/roadmap_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PublicRoadmapsScreen extends StatelessWidget {
  const PublicRoadmapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Comunidad', type: 0),
      body: SingleChildScrollView(
        child: Column(children: [
          for (var i = 0; i < 10; i++)
            RoadmapCard(
              myRoadmap: false,
              onTap: () => context.router.navigateNamed(
                ('/logged/comunidad/${i}'),
              ),
            ),
        ]),
      ),
    );
  }
}
