class CatalogModel{
  static List<Item> items = [
    ];

}

 class Item{
  final int? id;
  final String? name;
  final String? desc;
  final num? price;
  final String? color;
  final String? image;



  Item({ this.id, this.name, this.desc, this.price, this.color, this.image});
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