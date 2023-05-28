import 'package:catalog/widgets/MyThemes.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return (
    Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Colors.transparent,
      ),

    )
    );
  }
  
}