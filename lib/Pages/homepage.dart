import 'package:flutter/material.dart';

class Homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const double days=37;

    return Scaffold(

          appBar:AppBar(
            title: Text("Flutter codepur") ,
          ),
          drawer: Drawer(),
          body: const Center(
            child: Text("this is not $days days of flutter i am gonna do it in a week"),
          ),
        );


  }

}