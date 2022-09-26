import 'package:drunk_guesser/database/drunk_guesser_db.dart';

class Category {
  final String name;
  final String description;
  final String iconPath;
  final String dbName;

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
  }) {
    // look in database if this category is purchased
    isPurchased();
  }

  Future<void> isPurchased() async {
    purchased = await DrunkGuesserDB.categoryPurchased(this);
  }

}