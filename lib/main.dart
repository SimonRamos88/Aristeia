import 'package:aristeia_app/core/utils/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aristeia_app/widgets/button.dart';
import 'firebase_options.dart';

void main() async {
  //esto es necesario para poder hacer la conexión con firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Aristeia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final gradients = AppGradients();

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                buttonText: "Iniciar sesión",
                width: 301,
                height: 48,
                borderRadius: 22,
                backgroundGradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff6D4CE4),
                    Color(0xff6D4CE4),
                    Color.fromRGBO(109, 76, 228, 0.75),
                  ],
                  stops: [0.0, 0.01, 1.0],
                ),
                splashColor: Color.fromRGBO(109, 76, 228, 0.85),
                colorText: Colors.white,
                fontSize: 16,
                onTap: (){
                  print('Share');
                },
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                buttonText: "Registrarse",
                width: 301,
                height: 48,
                borderRadius: 22,
                backgroundGradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                  Colors.white,
                  Colors.white,
                  ],
                ),
                borderGradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                  Color(0xff6D4CE4),
                  Color(0xff6D4CE4),
                  Color.fromRGBO(109, 76, 228, 0.75),
                  ],
                  stops: [0.0, 0.01, 1.0],
                ),
                splashColor: Color.fromRGBO(249, 247, 255, 0.2),
                colorText: Color(0xff6D4CE4),
                fontSize: 16,
                strokeWidth: 2,
                onTap: (){
                  print('Share');
                },
              ),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                buttonText: "Agregar etiqueta",
                width: 301,
                height: 48,
                borderRadius: 22,
                backgroundGradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                  Color(0xff4650FA),
                  Color.fromRGBO(70, 80, 250, 0.7),
                  Color.fromRGBO(70, 80, 250, 0),
                  ],
                  stops: [0.0, 0.9323, 1.0],
                ),
                splashColor: Color.fromRGBO(70, 80, 250, 0.7),
                colorText: Colors.white,
                fontSize: 16,
                onTap: (){
                  print('Share');
                },
              ),
            ],
          )
        ),
    );
  }
}
