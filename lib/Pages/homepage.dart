import 'dart:convert';

import 'package:catalog/models/catalogs.dart';
import 'package:catalog/utils/MyRoutes.dart';
import 'package:catalog/widgets/MyThemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../widgets/HomePageWidgets/catalogheader.dart';
import '../widgets/HomePageWidgets/cataloglist.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //whenever this homepage widget is initialized we will get the data from our json file
  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogjson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedata = jsonDecode(catalogjson);
    var productsdata = decodedata["products"];
    //we have a class catalog models wherein we have a list called items, so we need to first fill that list
    //then we can use that list in fetch method
    CatalogModel.items = List.from(productsdata)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dumylist=List.generate(50, (index) => CatalogModel.items[0]);

    return (
     Scaffold(


       floatingActionButton: FloatingActionButton(
         onPressed: () {

           Navigator.pushNamed(context, MyRoutes.cartroute);

         },
         backgroundColor: MyTheme.darkbluish,
         child: const Icon(CupertinoIcons.cart,color: Colors.white),

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



