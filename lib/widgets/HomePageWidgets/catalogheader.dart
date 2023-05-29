import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text("Catalog App",
                textScaleFactor: 3,
                style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold)),
             Text("Trending products",textScaleFactor: 1.2,style: TextStyle(color: Theme.of(context).colorScheme.secondary),)

          ],
        )

    );


  }

}