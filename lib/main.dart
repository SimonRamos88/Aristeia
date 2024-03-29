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
      title: 'Aristeia',
      theme: ThemeData(
        primaryColor: colors.mainColor,
        dividerColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          backgroundColor: colors.backgroundColor,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'Quicksand'),
          displayMedium: TextStyle(fontFamily: 'Quicksand'),
          displaySmall: TextStyle(fontFamily: 'Quicksand'),
          headlineLarge: TextStyle(fontFamily: 'Quicksand'),
          headlineMedium: TextStyle(fontFamily: 'Quicksand'),
          headlineSmall: TextStyle(fontFamily: 'Quicksand'),
          titleLarge: TextStyle(fontFamily: 'Quicksand'),
          titleMedium: TextStyle(fontFamily: 'Quicksand'),
          titleSmall: TextStyle(fontFamily: 'Quicksand'),
          bodyLarge: TextStyle(fontFamily: 'Quicksand'),
          bodyMedium: TextStyle(fontFamily: 'Quicksand'),
          labelLarge: TextStyle(fontFamily: 'Quicksand'),
          bodySmall: TextStyle(fontFamily: 'Quicksand'),
          labelMedium: TextStyle(fontFamily: 'Quicksand'),
          labelSmall: TextStyle(fontFamily: 'Quicksand'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
