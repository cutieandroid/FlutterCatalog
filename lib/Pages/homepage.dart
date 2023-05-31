import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:catalog/core/MyStore.dart';
import 'package:catalog/models/cartmodel.dart';
import 'package:catalog/models/catalogs.dart';
import 'package:catalog/utils/MyRoutes.dart';
import 'package:catalog/widgets/MyThemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';


import '../widgets/HomePageWidgets/catalogheader.dart';
import '../widgets/HomePageWidgets/cataloglist.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>{
  //whenever this homepage widget is initialized we will get the data from our json file
  @override
  void initState() {
    super.initState();
    loaddata();
  }
  final url="https://api.jsonbin.io/v3/b/6475fc788e4aa6225ea6a43e";

  loaddata() async {
    await Future.delayed(Duration(seconds: 2));
    final response= await http.get(Uri.parse(url));
    //var catalogjson = await rootBundle.loadString("assets/files/catalog.json");
    var catalogjson=response.body;
    var decodedata = jsonDecode(catalogjson);
    //var productsdata=decodeddata["products"];
    var data = decodedata["record"];
    var productsdata=data["products"];
    //we have a class catalog models wherein we have a list called items, so we need to first fill that list
    //then we can use that list in fetch method
    if (productsdata!= null) {
      CatalogModel.items = List.from(productsdata)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
      setState(() {});
    } else {
      // do something else
    }


  }

  @override
  Widget build(BuildContext context) {
    //final dumylist=List.generate(50, (index) => CatalogModel.items[0]);
    final cart= (VxState.store as MyStore).cart;

    return (
     Scaffold(


       floatingActionButton: VxBuilder(
         builder: (BuildContext context, store, VxStatus? status) =>
           FloatingActionButton(
             onPressed: () {

               Navigator.pushNamed(context, MyRoutes.cartroute);

             },
             backgroundColor: MyTheme.darkbluish,
             child: const Icon(CupertinoIcons.cart,color: Colors.white),

           ).badge(color: Colors.red,count: cart.items.length,size: 25,textStyle: TextStyle(fontSize: 20)),

         mutations: {AddMutation,RemoveMutation},
       ),

       backgroundColor: Theme.of(context).canvasColor ,
       body: SafeArea(
         bottom: false,
         child: Container(
           padding:const EdgeInsets.symmetric(horizontal: 18,vertical: 30),
             child:Column(
               crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               CatalogHeader(), if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                 Expanded(child: Padding(
                   padding: const EdgeInsets.only(top:16),
                   child: CataLogList(),
                 )) //we need to expand when we need to display list in column

               else
                 const Expanded(
                   child:  Center
                     (child: CircularProgressIndicator()
                   ),
                 )
             ],
               
           )

         ),
       ),

     )
    );
  }
}



