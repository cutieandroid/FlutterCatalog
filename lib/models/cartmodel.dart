import 'package:catalog/models/catalogs.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/MyStore.dart';


class CartModel{

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
//using Vxstate we can use addmutation instead of add item as we are now stateless
class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    //now we can perform task of adding item here
    store?.cart._itemids.add(item.id);

  }

}

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    //now we can perform task of adding item here
    store?.cart._itemids.remove(item.id);

  }

}