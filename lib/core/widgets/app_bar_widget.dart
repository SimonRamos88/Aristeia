import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int type;
  final void Function()? onPressedLeading;
  final void Function()? onPressedAction;
  final PreferredSizeWidget tabBar;


  const AppBarWidget({
    super.key,
    this.title = '',
    this.type = 0,
    this.onPressedLeading,
    this.onPressedAction,
    this.tabBar = const PreferredSize(
      preferredSize: Size(0, 0),
      child: Text(''),
    ),
  });

  const AppBarWidget.tab({
    super.key,
    this.title = '',
    this.type = 0,
    this.onPressedLeading,
    this.onPressedAction,
    this.tabBar = const PreferredSize(
      preferredSize: Size(0, 0),
      child: Text(''),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      toolbarHeight: 50,
      centerTitle: true,
        title: Text(
          title,
          style: heading2bStyle.copyWith(color: Theme.of(context).primaryColor),
        ),
        leading: (type == 1 || type == 3)
            ? IconButton(
                onPressed: onPressedLeading,
                icon: Icon(Icons.arrow_back,
                    color: Theme.of(context).primaryColor),
              )
            : (type == 2)
                ? IconButton(
                    onPressed: onPressedLeading,
                    icon: Icon(Icons.settings,
                        color: Theme.of(context).primaryColor),
                  )
                : (type == 5 || type == 6 || type == 7)
                    ? IconButton(
                        onPressed: onPressedLeading,
                        icon: Icon(Icons.search,
                            color: Theme.of(context).primaryColor),
                      )
                    : (null),
        actions: (type != 0 && type != 1)
            ? <Widget>[
                (type == 2)
                    ? IconButton(
                        onPressed: onPressedAction,
                        icon: Icon(Icons.logout,
                            color: Theme.of(context).primaryColor),
                      )
                    : (type == 4)
                        ? IconButton(
                            onPressed: onPressedAction,
                            icon: Icon(Icons.notifications,
                                color: Theme.of(context).primaryColor),
                          )
                        : (type == 5 || type == 6 || type == 7)
                            ? IconButton(
                                onPressed: onPressedAction,
                                icon: Icon(Icons.tune,
                                    color: Theme.of(context).primaryColor),
                              )
                            : IconButton(
                                onPressed: onPressedAction,
                                icon: Icon(Icons.tab,
                                    color: Theme.of(context).primaryColor),
                              )
              ]
            : null);
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight);
  //Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
