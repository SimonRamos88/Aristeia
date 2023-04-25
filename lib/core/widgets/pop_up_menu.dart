import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({super.key});

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
            onTap: () => print('Editar roadmap'),
            textStyle: subheadingbStyle.copyWith(color:Colors.black),
            value: 1,
            child: Row(
              children: const [
                Icon(Icons.edit, size: 16),
                SizedBox(width: 8),
                Text('Editar roadmap'),
              ],
            ),
          ),
          PopupMenuItem<int>(
            onTap: () {
              showDialog(
                context: context,
                builder: ((context) => AlertDialogWidget(
                      message: '¿Estas seguro de eliminar este roadmap?',
                      leftText: 'Eliminar',
                      rightText: 'Cancelar',
                      onTapLeft: () {
                        context.router.popUntilRoot();
                      },
                      onTapRight: () {
                        Navigator.of(context).pop();
                      },
                    )),
              );
            },
            textStyle: subheadingbStyle.copyWith(color:Colors.black),
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
