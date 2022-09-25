class Category {
  final String name;
  final String description;
  final String iconPath;

  /*
  If false then the card is grey, and has a lock in front of it.
   */
  bool purchased = false;

  Category({
    required this.name,
    required this.description,
    required this.iconPath,
  });


}