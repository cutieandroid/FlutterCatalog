import 'package:flutter/material.dart';

import '../widgets/MyDrawer.dart';

class Homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const double days=37;

    return Scaffold(

          appBar:AppBar(
            title: const Text("Home") ,
          ),
          drawer: MyDrawer(),
          body: const Center(
            child: Text("this is not $days days of flutter i am gonna do it in a week"),
          ),
        );


  }

}