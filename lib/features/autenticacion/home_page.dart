import 'package:aristeia_app/core/network/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class home_page extends StatelessWidget{
  home_page({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async{
    await Auth().signOut();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text("Roadmap To"),

      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/NyanCat.png',width: 250,height: 250,),
            Text("Holiiii usuario"),
            Text(user?.email ?? 'User email'),
            ElevatedButton(onPressed: signOut, child: Text("Salir uwu"))


          ],

        ),

      ),

    );

  }

}
