import 'dart:async';
import 'package:aristeia_app/core/network/auth.dart';
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    User? user = Auth().currentUser;

    print(user);

    if (user != null && user.emailVerified==true) {
      context.router.replace(const LoggedWrapperRoute());
    }
    else {
      // we redirect the user to our login page
      // router.push(WelcomeRoute());
      // resolver.next(false);
      context.router.replace(const WelcomeRouter());
    }

    // context.router.replace(const WelcomeRouter());
    // if they are not logged in, bring them to the Login page

    // context.router.push(LoggedWrapperRoute());
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
                Text(
                  'RoadmapTo',
                  style: TextStyle(
                    color: Color.fromARGB(223, 231, 229, 240),
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.w700,
                    fontSize: 50,
                  ),
                ),
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
