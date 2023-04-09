import 'dart:async';
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  static final colors = AppColors();

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    context.router.replace(const WelcomeRouter());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              SplashScreen.colors.mainColor,
              SplashScreen.colors.mainColor80,
            ],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
            Image(
              image: AssetImage('assets/images/splashLogo.png'),
              width: 300,
              height: 300,
            ),
            SizedBox(
              width: 1,
              height: 30,
            ),
            Text('RoadmapTo',
            style: TextStyle(
              color: Color.fromARGB(255, 231, 229, 240),
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w700,
              fontSize: 50,
            ),),
          ]),
        ),
      ),
    );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   return AnimatedSplashScreen(
  //     backgroundColor: colors.mainColor,
  //       pageTransitionType: PageTransitionType.fade,
  //       animationDuration: const Duration(seconds: 2),
  //       centered: true,
  //       splashIconSize: 300,
  //       splash: Image.asset('assets/images/splashLogo.png'),
  //       nextScreen:  RedirectRoute(path: '', redirectTo: 'users'), 
  //     );
  // }