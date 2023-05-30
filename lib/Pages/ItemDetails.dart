import 'package:catalog/widgets/HomePageWidgets/AddToCart.dart';
import 'package:catalog/widgets/ItemDetailsWidget/ArcWidget.dart';
import 'package:flutter/material.dart';

import '../models/catalogs.dart';


class ItemDetails extends StatelessWidget{

  final Item gotitem;

  const ItemDetails({super.key, required this.gotitem});



  @override
  Widget build(BuildContext context) {

    return(
    Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:
      Container(
        color: Theme.of(context).canvasColor,
        child: ButtonBar(
          buttonPadding: EdgeInsets.fromLTRB(0, 0, 16, 0),
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${gotitem.price.toString()}", textScaleFactor:1.4,style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),

           AddToCart(catalog: gotitem)
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      body: SafeArea(
        bottom: false,
        child: Column(

          children: [
            Expanded(
                child: Hero(
                tag:Key(gotitem.id.toString()),
                 child: Image.network(gotitem.image.toString())
            )
            ),
            Expanded(child: ArcWidget(gotitem: gotitem))

          ],
        ),
      ),
    )

    );
  }

}