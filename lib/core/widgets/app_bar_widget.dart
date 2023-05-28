import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/pop_up_menu.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final int type;
  final void Function()? onPressedLeading;
  final void Function()? onPressedAction;
  final int color;
  final Widget rightWidget;

  const AppBarWidget({
    super.key,
    this.title = '',
    this.type = 0,
    this.onPressedLeading,
    this.onPressedAction,
    this.color = 0,
    this.rightWidget = const SizedBox(),
  });

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
  
 
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {

    final colors = AppColors();
    final Color colorAll = (widget.color == 1)?colors.blueColor: (widget.color == 2)? colors.pinkColor :Theme.of(context).primaryColor;

    return AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        //toolbarHeight: 45,
        centerTitle: true,
        title: Text(
          widget.title,
          style: heading2bStyle.copyWith(color: colorAll),
        ),
        leading: (widget.type == 1 || widget.type == 3)
            ? IconButton(
                onPressed: widget.onPressedLeading,
                icon: Icon(Icons.arrow_back, color: colorAll),
              )
            : (widget.type == 2)
                ? IconButton(
                    onPressed: widget.onPressedLeading,
                    icon: Icon(Icons.settings, color: colorAll),
                  )
                : (widget.type == 5 || widget.type == 6 || widget.type == 7)
                    ? IconButton(
                        onPressed: widget.onPressedLeading,
                        icon: Icon(Icons.search, color: colorAll),
                      )
                    : (null),
        actions: (widget.type != 0 && widget.type != 1)
            ? <Widget>[
                (widget.type == 2)
                    ? IconButton(
                        onPressed: widget.onPressedAction,
                        icon: Icon(Icons.logout, color: colorAll, weight: 100,),
                      )
                    : (widget.type == 3)
                        ? widget.rightWidget
                        : (widget.type == 5 || widget.type == 6 || widget.type == 7)
                            ? IconButton(
                                onPressed: widget.onPressedAction,
                                icon: Icon(Icons.tune, color: colorAll),
                              )
                            : IconButton(
                                onPressed: widget.onPressedAction,
                                icon: Icon(Icons.tab,
                                    color: colorAll),
                              )
              ]
            : null);
  }

}
