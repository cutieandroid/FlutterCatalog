import 'dart:convert';

import 'package:catalog/models/catalogs.dart';
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

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: MyDrawer(),
        body: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: CatalogModel.items[index],
                  );
                })
            : const Center(child: CircularProgressIndicator()));
  }
}
