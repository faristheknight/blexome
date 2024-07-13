// lib/database/shop.dart

class Shop {
  int id;
  String shop;
  String inuse;

  Shop({
    this.id = 0,
    required this.shop,
    required this.inuse,
  });

  // Convert a Shop into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'shop': shop,
      'inuse': inuse,
    };
  }

  // A method that retrieves a Shop from a Map.
  Shop.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        shop = map['shop'],
        inuse = map['inuse'];
}
