import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
final Function()? onTap1;
final Function()? onTap2;

  PopUpMenu({
    super.key,
    this.onTap1, 
    this.onTap2,
    });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      child: PopupMenuButton<int>(
        //  onSelected: (item) => onSelected(context, item),
        elevation: 5,
        //color: Colors.white,
        itemBuilder: (context) => [
          PopupMenuItem<int>(
            onTap: onTap1,
            textStyle: subheadingbStyle.copyWith(color: Colors.black),
            value: 1,
            child: Row(
              children: const [
                Icon(Icons.edit, size: 16),
                SizedBox(width: 8),
                Text('Editar Datos roadmap'),
              ],
            ),
          ),
          PopupMenuItem<int>(
            onTap: onTap2,
            textStyle: subheadingbStyle.copyWith(color: Colors.black),
            value: 1,
            child: Row(
              children: const [
                Icon(Icons.delete, size: 16),
                SizedBox(width: 8),
                Text('Eliminar roadmap'),
              ],
            ),
          ),
          // PopupMenuItem<int>(
          //   textStyle: subheadingStyle,
          //   value: 0,
          //   child: Row(
          //     children: const [
          //       Icon(Icons.flag, size: 16),
          //       SizedBox(width: 8),
          //       Text('Reportar roadmap'),
          //     ],
          //   ),
          // ),
          //const PopupMenuDivider(),
        ],
      ),
    );
  }
}




// https://github.com/JohannesMilke/settings_menu_example/blob/master/lib/main.dart
