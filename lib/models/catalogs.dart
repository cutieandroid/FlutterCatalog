class CatalogModel{



  static List<Item> items = [
    ];


  //get item by id
   Item getbyid(int id)=>
    items.firstWhere((element) => element.id==id, orElse: null);

  //get item by position
   Item getbyposition(int pos)=> items[pos];


}

 class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;



  Item({ required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
  //we made this new constructor which will be used incase of map data structure, as we are decoding
  //it into map from json and then using it, we need to first map them both
  factory Item.fromMap(Map<String,dynamic> map)=> Item(

    id: map["id"],
    name: map["name"],
    desc: map["desc"],
    price: map["price"],
    color: map["color"],
    image: map["image"]




    );

  tomap()=> {
    "id":id,
    "name":name,
    "desc":desc,
    "color":color,
    "image":image

  };



}