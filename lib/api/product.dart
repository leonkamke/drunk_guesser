import '../models/category.dart';

class Product {
  final String name;
  final String id;
  final List<Category> categories;

  /*
  If false then the card is grey, and has a lock in front of it.
   */
  bool purchased = false;

  Product({
    required this.name,
    required this.id,
    required this.categories,
  });

}