import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key} ):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      home: Material(
        child: Center(
          child: Text("this is not 30 days of flutter i am gonna do it in a week"),
        ),
      ),

    );
  }
}