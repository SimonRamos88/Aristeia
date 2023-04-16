import 'package:aristeia_app/core/network/auth.dart';
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/button.dart';
import 'package:aristeia_app/core/widgets/info_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@RoutePage()
class HomeScreen extends StatefulWidget{
  HomeScreen({super.key});

  State<HomeScreen> createState() => _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen> {
  static final gradients = AppGradients();

  final User? user = Auth().currentUser;
  String usertag= 'usertag';
  String usernames= 'nombres';
  Future<void> signOut() async {
    await Auth().signOut();
    print("deslogeado");
  }


  Future<void> readUserData() async{
    final docUser= FirebaseFirestore.instance.collection('usuarios').doc(user?.uid);
    final queryU = await docUser.get();
    setState(() {
      usertag= queryU.get('usertag');
      usernames= queryU.get('nombres');
    });
    print('funciono');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'RoadmapTo',
        type: 2,
        onPressedAction: () {
          signOut;
          context.router.replace(const WelcomeRouter());
        },
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          //Tarjeta de inicio del usuario
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: InfoCard(
              child: Row(children: [
                const Image(
                    width: 73,
                    height: 73,
                    image: AssetImage('assets/images/profileImage.png')),
                const SizedBox(
                  width: 24,
                  height: 1,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(usertag ?? "usertag",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: heading2bStyle.copyWith(
                              color: Theme.of(context).primaryColor)),
                      Text(usernames ?? 'Nombres',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: interHeading3Style.copyWith(
                              color: Theme.of(context).primaryColor)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(user?.email ?? 'User email', style: bodyStyle),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          BoxText.section(
            text: 'Mis estadísticas:',
            centered: false,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 24, right: 12),
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    'Tiempo dedicado a RoadmapTo esta semana:',
                    textAlign: TextAlign.center,
                    style: heading3bStyle.copyWith(
                        color: Theme.of(context).primaryColor),
                  )),
              Expanded(
                child: InfoCard(
                  child: Text(
                    '24 horas 30 minutos',
                    textAlign: TextAlign.center,
                    style: interHeading3Style,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          BoxText.section(
              text: 'Roadmaps culminados:',
              centered: false,
              color: Theme.of(context).primaryColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 24, right: 12),
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    'Este mes has completado:',
                    textAlign: TextAlign.center,
                    style: heading3bStyle.copyWith(
                        color: Theme.of(context).primaryColor),
                  )),
              Expanded(
                child: InfoCard(
                  child: Text(
                    '20 bloques y 2 roadmaps',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: interHeading3Style,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
