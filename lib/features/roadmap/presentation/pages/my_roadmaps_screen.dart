import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/features/roadmap/presentation/Widgets/get_roadmap_privado.dart';
import 'package:aristeia_app/features/roadmap/presentation/Widgets/filters_drawer.dart';
import 'package:aristeia_app/features/roadmap/presentation/Widgets/my_search_delegate.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyRoadmapsScreen extends StatefulWidget {
  const MyRoadmapsScreen({super.key});

  @override
  State<MyRoadmapsScreen> createState() => _MyRoadmapsScreenState();
}

class _MyRoadmapsScreenState extends State<MyRoadmapsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Mis roadmaps',
        type: 5,
        onPressedLeading: () {
          showSearch(
            context: context,
            delegate: MySearchDelegate('privado'),
          );
        },
        onPressedAction: () => Scaffold.of(context).openEndDrawer(),
      ),
      body: getRoadmapPrivado(''),
    );
  }
}


