import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text("Catalog App",
                textScaleFactor: 1,
                style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold,fontSize: 40)),
             Text("Trending products",textScaleFactor: 1,style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 18),)

          ],
        )

    );


  }

}