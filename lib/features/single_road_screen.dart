import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/block_card.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SingleRoadScreen extends StatefulWidget {
  final int roadId;
  const SingleRoadScreen({
    Key? key,
    @PathParam() required this.roadId,
  }) : super(key: key);

  @override
  State<SingleRoadScreen> createState() => _SingleRoadScreenState();
}

class _SingleRoadScreenState extends State<SingleRoadScreen> {
  static final colors = AppColors();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        type: 1,
        onPressedLeading: () {
          context.router.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BoxText.tituloPagina(text:'Roadmap ${widget.roadId}', color: colors.blueColor,),
            for (var i = 0; i < 10; i++)
            BlockCard(
              nombreBloque: "Bloque ${i}",
              onTap: () => context.router.navigate(
                // BlockRouter()
                SingleBlockRoute(blockId: i),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
