import 'dart:async';
import 'package:aristeia_app/core/network/auth.dart';
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:aristeia_app/core/utils/text_styles.dart';
import 'package:aristeia_app/core/widgets/alert_dialog_widget.dart';
import 'package:aristeia_app/core/widgets/app_bar_widget.dart';
import 'package:aristeia_app/core/widgets/box_text.dart';
import 'package:aristeia_app/core/widgets/info_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_usage/app_usage.dart';
import 'dart:core';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late TabController tabController;
  Map<String, dynamic> respuesta = {"": ""};
  DateTime fechaActual = DateTime.now().toLocal();
  DateTime _startTime = DateTime.now().toLocal();
  DateTime _finishTime = DateTime.now().toLocal();
  Duration _totalUsageDuration = Duration.zero;
  int _timeInSeconds = 0;
  Timer? _timer;
  AppLifecycleState? _lastLifecyleState;
  final AppLifecycleObserver observer = AppLifecycleObserver();
  final User? user = Auth().currentUser;
  String usertag = 'usertag';
  String usernames = 'nombres';
  Map<String, dynamic> appUsage = Map<String, dynamic>.from({});

  Future<void> readUserData() async {
    final docUser = FirebaseFirestore.instance
        .collection('usuarios')
        .doc((Auth().currentUser?.uid));
    final queryU = await docUser.get();
    if (mounted) {
      setState(() {
        respuesta = queryU.data() as Map<String, dynamic>;
        usertag = respuesta['usertag'];
        usernames = respuesta['nombres'];
        if (respuesta['usoAplicacion'] != null) {
          appUsage = respuesta['usoAplicacion'];
        }
        print(appUsage);
      });
    }
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    readUserData();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_lastLifecyleState == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        didChangeAppLifecycleState(AppLifecycleState.resumed);
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      _lastLifecyleState = state;
    });
    if (state == AppLifecycleState.resumed) {
      print('La aplicación se ha reanudado');
      _startTime = DateTime.now();
      print(_startTime);
      print(_lastLifecyleState);
    }
    if (state == AppLifecycleState.paused) {
      print('La aplicación se ha pausado');
      _totalUsageDuration += DateTime.now().difference(_startTime);
      _finishTime = DateTime.now();
      print(_finishTime);
      print(_lastLifecyleState);
    }
  }

  void _updateFirestore() async {
    final firestore = FirebaseFirestore.instance;
    final user = "userId"; // Replace with the actual user ID

    final currentWeek = "Week21"; // Replace with the current week
    final currentDoc = firestore.collection("UsoSemanales").doc(user);

    final currentData = await currentDoc.get();
    int currentUsage = currentData.data()?[currentWeek] ?? 0;

    await currentDoc.update({
      currentWeek: currentUsage + _timeInSeconds,
    });

    setState(() {
      _timeInSeconds = 0;
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void cerrarSesion() {
    showDialog(
      context: context,
      builder: ((context) => AlertDialogWidget(
            message: '¿Estas seguro de cerrar sesión?',
            leftText: 'Cerrar',
            rightText: 'Cancelar',
            onTapLeft: () {
              Auth().signOut().then((_) {
                didChangeAppLifecycleState(AppLifecycleState.paused);
              });
              context.showFlash<bool>(
                  barrierDismissible: true,
                  duration: const Duration(seconds: 5),
                  builder: (context, controller) => FlashBar(
                        controller: controller,
                        forwardAnimationCurve: Curves.easeInCirc,
                        reverseAnimationCurve: Curves.bounceIn,
                        position: FlashPosition.bottom,
                        indicatorColor: Theme.of(context).primaryColor,
                        icon: const Icon(Icons.check),
                        content: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              'Sesión cerrada exitosamente',
                              textAlign: TextAlign.center,
                              style: heading3bStyle,
                            )),
                      ));
              context.router.replace(const WelcomeRouter());
            },
            onTapRight: () {
              Navigator.of(context).pop();
            },
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          title: 'RoadmapTo',
          type: 2,
          onPressedLeading: () {
            context.router.push(const ConfigRouter());
          },
          onPressedAction: cerrarSesion,
        ),
        body: Column(
          children: [
            ProfileCard(
              nombre: usernames,
              usertag: usertag,
              correo: user?.email ?? 'Correo no registrado',
            ),
            BoxText.section(
              text: 'Mis estadísticas:',
              centered: false,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 8,
            ),
            InfoRow(
                description: 'Tiempo dedicado a RoadmapTo esta semana:',
                info: _startTime.toString()),
            const SizedBox(
              height: 16,
            ),
            BoxText.section(
                text: 'Roadmaps culminados:',
                centered: false,
                color: Theme.of(context).primaryColor),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    width: 1.5),
              ),
              child: TabBar(
                controller: tabController,
                labelColor: Colors.white,
                labelStyle: heading3bStyle,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(31, 35, 9, 39), // shadow color
                        blurRadius: 4, // shadow radius
                        offset: Offset(0, 4), // shadow offset
                        spreadRadius:
                            0, // The amount the box should be inflated prior to applying the blur
                        blurStyle: BlurStyle.normal // set blur style
                        ),
                  ],
                  color: Theme.of(context).primaryColor,
                ),
                unselectedLabelColor: Theme.of(context).primaryColor,
                tabs: const [
                  Tab(
                    text: 'Semana',
                  ),
                  Tab(
                    text: 'Mes',
                  ),
                  Tab(
                    text: 'Año',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Scaffold(
                    body: InfoRow(
                        description: 'Esta semana has completado:',
                        info: '20 bloques y 2 roadmaps'),
                  ),
                  Scaffold(
                    body: InfoRow(
                        description: 'Este mes has completado:',
                        info: '40 bloques y 6 roadmaps'),
                  ),
                  Scaffold(
                    body: InfoRow(
                        description: 'Este año has completado:',
                        info: '100 bloques y 5 roadmaps'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class ProfileCard extends StatelessWidget {
  final String usertag;
  final String nombre;
  final String correo;
  final Function()? onTap;

  const ProfileCard(
      {super.key,
      this.onTap,
      this.usertag = '',
      this.nombre = '',
      this.correo = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text(usertag,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: heading2bStyle.copyWith(
                        color: Theme.of(context).primaryColor)),
                Text(nombre,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: interHeading3Style.copyWith(
                        color: Theme.of(context).primaryColor)),
                const SizedBox(
                  height: 5,
                ),
                Text(correo, style: bodyStyle),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String description;
  final String info;

  const InfoRow({super.key, this.info = '', this.description = ''});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            padding: const EdgeInsets.only(left: 24, right: 12),
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: heading3bStyle.copyWith(
                  color: Theme.of(context).primaryColor),
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InfoCard(
              child: Text(
                info,
                textAlign: TextAlign.center,
                style: interHeading3Style,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      default:
        break;
    }
  }
}
