import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Catalog App",
                textScaleFactor: 3,
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            Text("Trending products",textScaleFactor: 1.2)

          ],
        )

    );


  }

}