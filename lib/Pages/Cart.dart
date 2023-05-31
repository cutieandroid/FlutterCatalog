import 'package:catalog/models/cartmodel.dart';
import 'package:catalog/widgets/MyThemes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/MyStore.dart';

class Cart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return (
    Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text("Cart", style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                child: CartList(),
              )
          ),
          Divider(),
          Cartfooter()
        ],
      ),

    )
    );
  }
  
}
class CartList extends StatelessWidget{

  final CartModel cart= (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return cart.items.isEmpty? Center(child: ( Text("Add Something To The Cart :)",textScaleFactor: 2,style: TextStyle(color:Theme.of(context).colorScheme.secondary)))):
    ListView.builder(
      itemBuilder: (context,index) =>
          ListTile(

            leading: Icon(Icons.done,color: Theme.of(context).colorScheme.secondary),
            trailing: InkWell(child: Icon(Icons.remove_circle_outline,color: Theme.of(context).colorScheme.secondary,),
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Removed ${cart.items[index].name} from cart"))
                );
                RemoveMutation(cart.items[index]);

              },
            ),
            title: Text(cart.items[index].name,style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
            onTap: () {

            },
          ),

      itemCount: cart.items.length,
    );
  }

}


class Cartfooter extends StatelessWidget{
  final CartModel cart= (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {

    return
      Padding(
      padding: const EdgeInsets.symmetric(horizontal:25,vertical: 30),
      child: Container(
        child: (

        Card(

          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,


              children: [
                  VxConsumer(
                    notifications: {},
                    mutations: {RemoveMutation},
                    builder: (context,store,status) {
                      return( Text("Total : \$${cart.totalprice}",textScaleFactor: 1,style: TextStyle(fontSize: 20),));
                    },

                  ),
                  ElevatedButton(onPressed:(){

                },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(StadiumBorder()),
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkbluish)
                    ),
                    child:const Text(
                        "Proceed To Checkout",
                      textScaleFactor: 0.8,
                    )
                )

              ],

            ),
          ),
        )
        ),
      ),
    );
  }
}