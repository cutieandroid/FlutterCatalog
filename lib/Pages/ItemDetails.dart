import 'package:catalog/widgets/ItemDetailsWidget/ArcWidget.dart';
import 'package:flutter/material.dart';

import '../models/catalogs.dart';
import '../widgets/MyThemes.dart';

class ItemDetails extends StatelessWidget{

  final Item gotitem;

  const ItemDetails({super.key, required this.gotitem});



  @override
  Widget build(BuildContext context) {

    return(
    Scaffold(
      appBar: AppBar(),

      body: SafeArea(
        child: Column(

          children: [
           /* Expanded(
                child: Hero(
                tag:Key(gotitem.id.toString()),
                 child: Image.network(gotitem.image.toString())
            )
            ),*/
            Expanded(child: ArcWidget())

          ],
        ),
      ),
    )

    );
  }

}