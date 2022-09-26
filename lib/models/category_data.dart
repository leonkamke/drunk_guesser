import 'category.dart';

class Categories {
  static Category zufall = Category(
    name: "Zufall (kostenlos)",
    dbName: "zufall",
    description: "Mischung aus 6 Kategorien",
    iconPath: "assets/categories_icons/random_icon.png",
    purchased: true,
  );
  static Category natur = Category(
      name: "Natur",
      dbName: "natur",
      description: "Fragen die sich rund um die Natur drehen",
      iconPath: "assets/categories_icons/nature_icon.png");
  static Category google = Category(
    name: "Google",
    dbName: "google",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/google_icon.png",
  );
  static Category geschichte = Category(
      name: "Geschichte",
      dbName: "geschichte",
      description: "Mischung aus 6 Kategorien",
      iconPath: "assets/categories_icons/history_icon.png");
  static Category technik = Category(
      name: "Technik",
      dbName: "technik",
      description: "Fragen die sich rund um die Natur drehen",
      iconPath: "assets/categories_icons/tech_icon.png");
  static Category preise = Category(
    name: "Preise",
    dbName: "preise",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/price_icon.png",
  );
  static Category medien = Category(
      name: "Medien & Unterhaltung",
      dbName: "medien",
      description: "Mischung aus 6 Kategorien",
      iconPath: "assets/categories_icons/media_icon.png");
  static Category weltall = Category(
      name: "Weltall",
      dbName: "weltall",
      description: "Fragen die sich rund um die Natur drehen",
      iconPath: "assets/categories_icons/space_icon.png");
  static Category sport = Category(
    name: "Sport",
    dbName: "sport",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/sports_icon.png",
  );
  static Category unnuetzes_wissen = Category(
    name: "Unnützes Wissen",
    dbName: "unnuetzes_wissen",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/images/drunk_guesser_img.png",
  );
  static Category achtzehn_plus = Category(
    name: "18+",
    dbName: "achtzehn_plus",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/18plus_icon.png",
  );
  static Category geographie = Category(
    name: "Geographie",
    dbName: "geographie",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/geography_icon.png",
  );
  static Category mensch = Category(
    name: "Mensch",
    dbName: "mensch",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/geography_icon.png",
  );
  static Category musik = Category(
    name: "Musik",
    dbName: "musik",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/music_icon.png",
  );

  static List<Category> categoryList = [
    zufall,
    technik,
    natur,
    weltall,
    unnuetzes_wissen,
    achtzehn_plus,
    geographie,
    google,
    sport,
    medien,
    musik,
    mensch,
    preise,
    geschichte,
  ];

}
