import 'package:catalog/models/catalogs.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cartmodel.dart';

class MyStore extends VxStore{

   late CatalogModel catalog;
   late CartModel cart;

  MyStore(){
    catalog=CatalogModel();
    cart=CartModel();
    cart.catalog=catalog;
  }

}