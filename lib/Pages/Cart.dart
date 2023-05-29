import 'package:catalog/models/cartmodel.dart';
import 'package:catalog/widgets/MyThemes.dart';
import 'package:flutter/material.dart';

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
class CartList extends StatefulWidget{
  @override
  CartListState createState()=>CartListState();

}

class CartListState extends State<CartList> {
  final cart= CartModel();
  @override
  Widget build(BuildContext context) {
    return cart.items.isEmpty? Center(child: ( Text("Add Some thing To The Cart :)",textScaleFactor: 2,style: TextStyle(color:Theme.of(context).colorScheme.secondary)))):
      ListView.builder(
        itemBuilder: (context,index) =>
          ListTile(

            leading: Icon(Icons.done,color: Theme.of(context).colorScheme.secondary),
            trailing: InkWell(child: Icon(Icons.remove_circle_outline,color: Theme.of(context).colorScheme.secondary,),
                onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Removed ${cart.items[index].name} from cart"))
              );
              cart.removeitem(cart.items[index]);
                             setState(() {

                             });
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
  @override
  Widget build(BuildContext context) {
    final cart= CartModel();
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
                  Text("Total : \$${cart.totalprice}",textScaleFactor: 1.5,),
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