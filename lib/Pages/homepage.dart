import 'dart:convert';

import 'package:catalog/models/catalogs.dart';
import 'package:catalog/widgets/MyThemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../widgets/ItemWidget.dart';
import '../widgets/MyDrawer.dart';

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
       backgroundColor: MyTheme.creamcolor,
       body: SafeArea(
         child: Container(
           padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
             child:Column(
               crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               CatalogHeader(), if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                 Expanded(child: CataLogList()) //we need to expand when we need to display list in column

               else
                 const Center
                   (child: CircularProgressIndicator()
                 )
             ],


           )

         ),
       ),

     )
    );
  }
}

class CataLogList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return(
    ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
        itemBuilder: (context,index){
        final catalog= CatalogModel.items[index];
        return ItemWidget(item: catalog);


        })
    );
  }
}
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
