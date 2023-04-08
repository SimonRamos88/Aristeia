import 'package:aristeia_app/core/network/create_auth.dart';
import 'package:aristeia_app/features/usuario/domain/repositories/createUsuario.dart';
import 'package:aristeia_app/features/usuario/domain/repositories/deleteUsuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './core/network/do_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/network/firebase_options.dart';

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
  int _counter = 0;

  Future<void> getRoadmaps() async {
    print('entrando');
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference collectionReferenceR = db.collection('roadmap');
    //DocumentSnapshot query =
    await collectionReferenceR
        .doc('1')
        .collection('bloques')
        .doc('1')
        .collection('recursos')
        .doc('2')
        .set({
      "nombre": "segundo recurso",
      "autor": "yo",
      "links_relacionados": ['jijiji', 'jjoojo']
    });

    // print(query.data());
    /*
    for (var r in query.docs) {
      print(r.data());
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('hola');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
