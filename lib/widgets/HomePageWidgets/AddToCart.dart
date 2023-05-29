import 'package:catalog/Pages/Cart.dart';
import 'package:catalog/models/cartmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/catalogs.dart';
import '../MyThemes.dart';

class AddToCart extends StatefulWidget{

  final Item catalog;

  const AddToCart({super.key, required this.catalog});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {

  final _cart= CartModel();

  @override
  Widget build(BuildContext context) {

    bool isincart=_cart.items.contains(widget.catalog) ?? false;

    return
      ElevatedButton(
          onPressed:(){
            if(isincart==true) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content:Text("Added into the Cart"))
              );
            }
            else {
              isincart = true;
              final _catalog = CatalogModel();

              _cart.catalog = _catalog;
              _cart.additem(widget.catalog);
              setState(() {

              });
            }



    },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder()),
            backgroundColor: MaterialStateProperty.all(MyTheme.darkbluish)
        ),
        child: isincart? const Icon(Icons.done,color: Colors.white): const Text(
            "Add to cart"
        )
    );

  }
}