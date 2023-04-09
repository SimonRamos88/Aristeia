import 'package:aristeia_app/core/routes/routes.dart';
import 'package:aristeia_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  //esto es necesario para poder hacer la conexión con firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);
  static final colors = AppColors();
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MyUnify',
      theme: ThemeData(
        primaryColor:  colors.mainColor,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
          backgroundColor: colors.backgroundColor,
          ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),);
    
  }
}
