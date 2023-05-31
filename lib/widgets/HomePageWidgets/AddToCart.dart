import 'package:catalog/core/MyStore.dart';
import 'package:catalog/models/cartmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalogs.dart';
import '../MyThemes.dart';

class AddToCart extends StatelessWidget {

  final Item catalog;
  final CartModel _cartmodel= (VxState.store as MyStore).cart;

   AddToCart({super.key, required this.catalog});


  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    bool isincart = _cartmodel.items.contains(catalog) ?? false;

    return
      ElevatedButton(
          onPressed: () {
            if (isincart == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added into the Cart"))
              );
            }
            else {
             AddMutation(catalog);

            }
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all(StadiumBorder()),
              backgroundColor: MaterialStateProperty.all(MyTheme.darkbluish)
          ),
          child: isincart
              ? const Icon(Icons.done, color: Colors.white)
              : const Text(
              "Add to cart",textScaleFactor: 1,
              style: TextStyle(fontSize: 12),
          )
      );
  }
}
