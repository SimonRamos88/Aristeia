import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/features/roadmap/presentation/Widgets/filters_drawer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../roadmap/presentation/Widgets/get_roadmap_privado.dart';

@RoutePage()
class LoggedWrapperScreen extends StatelessWidget {
  const LoggedWrapperScreen({Key? key}) : super(key: key);
  static final colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsScaffold(
        routes: [
          HomeRoute(),
          MisRoadmapsRouter(),
          ComunidadRouter(),
          CreateRouter()
        ],
        // appBarBuilder: (_, tabsRouter) => AppBarWidget(type: tabsRouter.activeIndex),
        bottomNavigationBuilder: (_, tabsRouter) {
          return SalomonBottomBar(
            unselectedItemColor: const Color.fromARGB(255, 200, 185, 250),
            selectedItemColor: Colors.white,
            backgroundColor: colors.mainColor,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 13,
            ),
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                activeIcon: const Icon(
                  Icons.home,
                  size: 30,
                ),
                title: const Text('Inicio', style: subheadingbStyle),
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.article_outlined,
                  size: 30,
                ),
                activeIcon: const Icon(
                  Icons.article,
                  size: 30,
                ),
                title: const Text('Propios', style: subheadingbStyle),
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.people_outline,
                  size: 30,
                ),
                activeIcon: const Icon(
                  Icons.people,
                  size: 30,
                ),
                title: const Text('Comunidad', style: subheadingbStyle),
              ),
              SalomonBottomBarItem(
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 30,
                ),
                activeIcon: const Icon(
                  Icons.add_circle,
                  size: 30,
                ),
                title: const Text('Crear', style: subheadingbStyle),
              )
            ],
          );
        },
        endDrawer: const FiltersDrawer(),
      ),
    );
  }
}
