import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/features/roadmap/presentation/Widgets/filters_drawer.dart';
import 'package:aristeia_app/features/roadmap/presentation/Widgets/get_roadmap_publico.dart';
import 'package:aristeia_app/features/roadmap/presentation/Widgets/my_search_delegate.dart';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PublicRoadmapsScreen extends StatefulWidget {
  const PublicRoadmapsScreen({super.key});

  @override
  State<PublicRoadmapsScreen> createState() => _PublicRoadmapsScreenState();
}

class _PublicRoadmapsScreenState extends State<PublicRoadmapsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Comunidad',
        type: 5,
        onPressedLeading: () {
          showSearch(
            context: context,
            delegate: MySearchDelegate('publico'),
          );
        },
         onPressedAction: () => Scaffold.of(context).openEndDrawer(),
      ),
      body: getRoadmapPublico(''),
    );
  }
}
