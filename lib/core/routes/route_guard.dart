
import 'package:aristeia_app/core/network/firebaseAuth.dart';
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGuard extends AutoRouteGuard {


  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    User? user = FirebaseAuth.instance.currentUser;

    //print(user);

    if (user != null) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // router.push(WelcomeRoute());
      // resolver.next(false);
      
      router.push(LoginRoute());   
    }
  }
}
