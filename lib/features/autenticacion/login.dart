import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aristeia_app/core/network/auth.dart';

class login extends StatefulWidget{
  const login({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<login> createState() => _loginPageState();
}
class _loginPageState extends State<login>{

  String? errorMessage = '';
  bool isLogin =true;
  final TextEditingController _controllerEmail =TextEditingController();
  final TextEditingController _controllerPassword =TextEditingController();

  Future<void> signInWithEmailAndPassword() async{
    try{
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text
      );
    } on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message;
      });
    }

  }
  Future<void> createUserWithEmailAndPassword() async{
    try{
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text
      );
    } on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message;
      });
    }

  }


  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("RoadmapTo"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.tag_faces_rounded,size: 100,),
            Text("Logeate (^_^)/"),
            _entryField("email", _controllerEmail),
            _entryField("password", _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton()


       ],
      ),
      )
    );
  }
  Widget _entryField(String title,  TextEditingController controller)
  { return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: title,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
    ),

  );
  }
  Widget _errorMessage(){
    return Text(errorMessage == '' ? '' : 'Hey... ? $errorMessage');
  }
  Widget _submitButton(){
    return ElevatedButton(
        child: Text(isLogin ? 'Login' : 'Register'),
        onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(255, 45, 70, 1),
        )
    );
  }
  Widget _loginOrRegisterButton(){
    return TextButton(
        onPressed: (){
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin? "Register Instead" : "Login Instead")
    );
  }

}


