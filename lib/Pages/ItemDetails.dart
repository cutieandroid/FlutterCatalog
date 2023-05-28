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
      bottomNavigationBar:
      ButtonBar(

        buttonPadding: EdgeInsets.fromLTRB(0, 0, 16, 0),
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("\$${gotitem.price.toString()}", textScaleFactor:1.4,style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),

          ElevatedButton(onPressed:(){

            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("Added ${gotitem.name.toString()} to cart"))

            );


          },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(StadiumBorder()),
                  backgroundColor: MaterialStateProperty.all(MyTheme.darkbluish)
              ),
              child:const Text(
                  "Buy"
              )
          )
        ],
      ),

      appBar: AppBar(),

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