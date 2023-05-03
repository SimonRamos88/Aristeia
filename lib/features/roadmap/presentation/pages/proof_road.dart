import 'package:flutter/material.dart';

class proof extends StatefulWidget {
  const proof({super.key});

  @override
  State<proof> createState() => _proofState();
}

class _proofState extends State<proof> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text('prueba'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              
            }, 
            child: Text('uwu'))
        ],
      ),
    );
  }
}