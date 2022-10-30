import 'dart:ui';

import 'package:drunk_guesser/api/product.dart';
import 'package:drunk_guesser/database/drunk_guesser_db.dart';

class Category {
  final String name;
  final String description;
  final String iconPath;
  final String dbName;
  final List<Color> colors;
  final Product? product;
  bool selected = false;

  /*
  If false then the card is grey, and has a lock in front of it.
   */
  bool purchased = false;

  Category({
    required this.name,
    required this.description,
    required this.iconPath,
    required this.dbName,
    this.purchased = false,
    required this.colors,
    required this.product
  }) {
    setPurchased();
  }

  /*
  Sets the purchased attribute with a lookup in the database
   */
  Future<void> setPurchased() async {
    purchased = await DrunkGuesserDB.categoryPurchased(this);
  }

}