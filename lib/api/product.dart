class Product {
  final String name;
  final String id;

  /*
  If false then the card is grey, and has a lock in front of it.
   */
  bool purchased = false;

  Product({
    required this.name,
    required this.id,
  });

}