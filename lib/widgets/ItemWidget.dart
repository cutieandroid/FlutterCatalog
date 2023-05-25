
import 'package:flutter/material.dart';

import '../models/catalogs.dart';



class ItemWidget extends StatelessWidget{
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: const StadiumBorder(),

      child: ListTile(
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

      ),
    );


  }
  
}
