import 'package:catalog/models/catalogs.dart';
import 'package:flutter/material.dart';

import '../widgets/ItemWidget.dart';
import '../widgets/MyDrawer.dart';

class Homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final dumylist=List.generate(50, (index) => Products.items[0]);
    const double days=37;

    return Scaffold(

          appBar:AppBar(
            title: const Text("Home") ,
          ),
          drawer: MyDrawer(),
          body:ListView.builder(
              itemCount:dumylist.length ,
              itemBuilder:(context, index){
                return ItemWidget(
                  item: dumylist[index],

                );

              })
        );


  }

}