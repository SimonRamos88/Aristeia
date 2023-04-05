
import 'package:aristeia_app/core/routes/routes.gr.dart';
import 'package:aristeia_app/features/splash_page.dart';
import 'package:aristeia_app/main.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')      
class AppRouter extends $AppRouter {      
   
 @override      
 final List<AutoRoute> routes = [    
     AutoRoute(
      path: '/',           
      page: HomeRoute.page),     
  ];    
}    

class $AppRouter {}

// flutter pub run build_runner build --delete-conflicting-outputs