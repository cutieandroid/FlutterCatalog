import 'package:catalog/widgets/MyThemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../../models/catalogs.dart';

class CustomShape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double height= size.height;
    double width=size.width;
    var path= Path();

    path.lineTo(0,height); //draw line to (0,height) that is from start point to bottom.now our current position is the left corner of container
    path.lineTo(width,height); // to get our desired shape we haave to paint the whole container then curve will cut upper part, now we are at bottom right of container

    path.lineTo(width, 0); //now our position is top right of contanier
    path.quadraticBezierTo(width/2, height/5, 0,0); //now draw quadratic curve from this current point that is top right to our start position that is 0,0 or top left


    path.close();
    
    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;

  }

}
class ArcWidget extends StatelessWidget{
  final Item gotitem;

  const ArcWidget({super.key, required this.gotitem});

  @override
  Widget build(BuildContext context) {
    return(
    ClipPath(

      clipper: CustomShape(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).canvasColor,
        padding: EdgeInsets.only(top: 50),
        child: Column(

          children: [
            Text(gotitem.name.toString(), textScaleFactor: 2,
                style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold)
            ),
            Text(gotitem.desc.toString(),style: TextStyle(color:Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.w100)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Text(lorem(paragraphs: 1,words: 40),style: TextStyle(color: Theme.of(context).colorScheme.secondary),textScaleFactor: 0.9,),
            )

          ],
        ),

      ),
    )



    );
  }

}