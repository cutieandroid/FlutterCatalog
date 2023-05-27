import 'package:catalog/Pages/ItemDetails.dart';
import 'package:flutter/material.dart';

import '../../models/catalogs.dart';
import 'ItemWidget.dart';

class CataLogList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return(
        ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context,index){
              final catalog= CatalogModel.items[index];
              return InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>ItemDetails(gotitem: catalog)
                      )
                  );
                },
                  child: ItemWidget(item: catalog)
              );


            })
    );
  }
}