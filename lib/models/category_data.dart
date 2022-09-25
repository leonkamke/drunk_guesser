import 'category.dart';

class Categories {
  static Category zufall = Category(
      name: "Zufall (kostenlos)",
      description: "Mischung aus 6 Kategorien",
      iconPath: "assets/categories_icons/random_icon.png"
  );
  static Category natur = Category(
      name: "Natur",
      description: "Fragen die sich rund um die Natur drehen",
      iconPath: "assets/categories_icons/nature_icon.png"
  );
  static Category google = Category(
      name: "Google",
      description: "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
      iconPath: "assets/categories_icons/google_icon.png",
  );
}