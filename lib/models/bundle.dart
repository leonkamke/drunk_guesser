import 'dart:ui';

import 'package:drunk_guesser/database/drunk_guesser_db.dart';

class Bundle {
  final String categoryNames;
  final String iconPath;
  final String price;

  /*
  If false then the card is grey, and has a lock in front of it.
   */
  bool purchased = false;

  Bundle({
    required this.categoryNames,
    required this.iconPath,
    required this.price,
    this.purchased = false,
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