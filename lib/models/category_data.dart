import 'dart:ui';

import 'category.dart';

class Categories {
  static Category zufall = Category(
    name: "Zufall (kostenlos)",
    dbName: "zufall",
    description: "Mischung aus 6 Kategorien",
    iconPath: "assets/categories_icons/random_icon.png",
    purchased: true,
    colors: const [Color(0xffffffff), Color(0xffffffff)],
  );
  static Category natur = Category(
    name: "Natur",
    dbName: "natur",
    description: "Fragen die sich rund um die Natur drehen",
    iconPath: "assets/categories_icons/nature_icon.png",
    colors: const [Color(0xffffffff), Color(0xffffffff)],
  );
  static Category google = Category(
    name: "Google",
    dbName: "google",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/google_icon.png",
    colors: const [Color(0xffffffff), Color(0xffffffff)],
  );
  static Category geschichte = Category(
    name: "Geschichte",
    dbName: "geschichte",
    description: "Mischung aus 6 Kategorien",
    iconPath: "assets/categories_icons/history_icon.png",
    colors: const [
      Color(0xffe8c34e),
      Color(0xffb49430),
    ],
  );
  static Category technik = Category(
    name: "Technik",
    dbName: "technik",
    description: "Fragen die sich rund um die Natur drehen",
    iconPath: "assets/categories_icons/tech_icon.png",
    colors: const [
      Color(0xffb7b7b7),
      Color(0xff7e7e7e),
    ],
  );
  static Category preise = Category(
    name: "Preise",
    dbName: "preise",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/price_icon.png",
    colors: const [Color(0xffffffff), Color(0xffffffff)],
  );
  static Category medien = Category(
    name: "Medien & Unterhaltung",
    dbName: "medien",
    description: "Mischung aus 6 Kategorien",
    iconPath: "assets/categories_icons/media_icon.png",
    colors: const [Color(0xffffffff), Color(0xffffffff)],
  );
  static Category weltall = Category(
    name: "Weltall",
    dbName: "weltall",
    description: "Fragen die sich rund um die Natur drehen",
    iconPath: "assets/categories_icons/space_icon.png",
    colors: const [Color(0xffffffff), Color(0xffffffff)],
  );
  static Category sport = Category(
    name: "Sport",
    dbName: "sport",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/sports_icon.png",
    colors: const [Color(0xffffffff), Color(0xffffffff)],
  );
  static Category unnuetzes_wissen = Category(
    name: "Unnützes Wissen",
    dbName: "unnuetzes_wissen",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/images/drunk_guesser_img.png",
    colors: const [Color(0xffffffff), Color(0xffffffff)],
  );
  static Category achtzehn_plus = Category(
    name: "18+",
    dbName: "achtzehn_plus",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/18plus_icon.png",
    colors: const [Color(0xffffffff), Color(0xffffffff)],
  );
  static Category geographie = Category(
    name: "Geographie",
    dbName: "geographie",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/geography_icon.png",
    colors: const [Color(0xffffffff), Color(0xffffffff)],
  );
  static Category mensch = Category(
    name: "Mensch",
    dbName: "mensch",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/geography_icon.png",
    colors: const [Color(0xffffffff), Color(0xffffffff)],
  );
  static Category musik = Category(
    name: "Musik",
    dbName: "musik",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/music_icon.png",
    colors: const [Color(0xffffffff), Color(0xffffffff)],
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
