
import 'package:catalog/widgets/MyThemes.dart';
import 'package:flutter/material.dart';

import '../../models/catalogs.dart';



class ItemWidget extends StatelessWidget{
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15) ),

        child: Row(
          children: [
            Hero(
              tag: Key(item.id.toString()),
                child: CatalogImage( image:item.image.toString())
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name.toString(), textScaleFactor: 1.2,
                        style: TextStyle(color: MyTheme.darkbluish,fontWeight: FontWeight.bold)
                    ),
                    Text(item.desc.toString(),style: TextStyle(fontWeight: FontWeight.w100),),
                    ButtonBar(
                      buttonPadding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                      alignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$${item.price.toString()}", textScaleFactor:1.4,style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),

                        ElevatedButton(onPressed:(){

                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                                 content: Text("Added ${item.name.toString()} to cart"))

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
                    )
                  ],

                ),
              ),
            )
          ],

        )











        /* ListTile(

          onTap: (){
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Pressed ${item.name}"),

            )
            );
          },
          leading: Image.network(item.image.toString()),
          title: Text(item.name.toString(),textScaleFactor: 1.2),
          subtitle: Text(item.desc.toString(),textScaleFactor: 1.1),
          trailing: Text("\$${item.price}",
              textScaleFactor: 1.2,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold
          ),
          ) ,
        ),*/

      ),
    );


  }
  
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
       child: (
       Image.network(image, scale: 4)
       ),
     );
  }
}
