import 'package:catalog/models/catalogs.dart';

class CartModel{

  static final cartModel=CartModel._internal();

  CartModel._internal();
  factory CartModel()=> cartModel;




  late CatalogModel _catalog;

  final List<int> _itemids=[];

  //getting catalog
  CatalogModel get catalog=> _catalog;
  //setting catalog
  set catalog(CatalogModel catalogModel){
    _catalog=catalogModel;
  }

  //get items in the cart
  List<Item> get items=> _itemids.map((id) => _catalog.getbyid(id)).toList();

 //generating total price

 num get totalprice => items.fold(0, (total, current) => total+current.price);

 //add item

 void additem(Item item){
   _itemids.add(item.id);
 }


//remove item

 void removeitem(Item item){
   _itemids.remove(item.id);
 }

}