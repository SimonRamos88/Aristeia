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
      appBar: const AppBarWidget(title: 'Comunidad', type: 0),
      body: SingleChildScrollView(
        child: Column(children: [
          for (var i = 0; i < 10; i++)
            RoadmapCard(
              myRoadmap: false,
              nombreRoadmap: "Roadmap ${i}",
              descripcionRoadmap: 'Esta es la descricpión del roadmap ${i}',
              estadoRoadmap: 0,
              etiquetas: ['etiqueta 1', 'etiqueta 2', 'etiqueta 3'],
              cantidadBloques: 10,
              calificacion: 4.5,
              onTap: () => context.router.navigateNamed(
                ('/logged/comunidad/${i}'),
              ),
            ),
        ]),
      ),
    );
  }
}
