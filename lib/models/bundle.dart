import 'dart:ui';

import 'package:drunk_guesser/database/drunk_guesser_db.dart';

class Bundle {
  final String categoryNames;
  final List<String> iconPath;
  final String dbName;
  final List<Color> colors;
  final String price;
  bool selected = false;

  /*
  If false then the card is grey, and has a lock in front of it.
   */
  bool purchased = false;

  Bundle({
    required this.categoryNames,
    required this.iconPath,
    required this.dbName,
    this.purchased = false,
    required this.colors,
    required this.price,
  }) {
  //  setPurchased();
  }

  /*
  Sets the purchased attribute with a lookup in the database
   */

  Future<void> setPurchased() async {
    //purchased = await DrunkGuesserDB.categoryPurchased(this);
  }
}