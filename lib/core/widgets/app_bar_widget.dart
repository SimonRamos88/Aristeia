import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/pop_up_menu.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int type;
  final void Function()? onPressedLeading;
  final void Function()? onPressedAction;
  final int color;

  const AppBarWidget({
    super.key,
    this.title = '',
    this.type = 0,
    this.onPressedLeading,
    this.onPressedAction,
    this.color = 0,
  });

  @override
  Widget build(BuildContext context) {

    final colors = AppColors();
    final Color colorAll = (color == 1)?colors.blueColor: (color == 2)? colors.pinkColor :Theme.of(context).primaryColor;

    return AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        //toolbarHeight: 45,
        centerTitle: true,
        title: Text(
          title,
          style: heading2bStyle.copyWith(color: colorAll),
        ),
        leading: (type == 1 || type == 3)
            ? IconButton(
                onPressed: onPressedLeading,
                icon: Icon(Icons.arrow_back, color: colorAll),
              )
            : (type == 2)
                ? IconButton(
                    onPressed: onPressedLeading,
                    icon: Icon(Icons.settings, color: colorAll),
                  )
                : (type == 5 || type == 6 || type == 7)
                    ? IconButton(
                        onPressed: onPressedLeading,
                        icon: Icon(Icons.search, color: colorAll),
                      )
                    : (null),
        actions: (type != 0 && type != 1)
            ? <Widget>[
                (type == 2)
                    ? IconButton(
                        onPressed: onPressedAction,
                        icon: Icon(Icons.logout, color: colorAll, weight: 100,),
                      )
                    : (type == 3)
                        ? const PopUpMenu()
                        : (type == 5 || type == 6 || type == 7)
                            ? IconButton(
                                onPressed: onPressedAction,
                                icon: Icon(Icons.tune, color: colorAll),
                              )
                            : IconButton(
                                onPressed: onPressedAction,
                                icon: Icon(Icons.tab,
                                    color: colorAll),
                              )
              ]
            : null);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  //Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
