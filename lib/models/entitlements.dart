import 'dart:ui';

import 'package:drunk_guesser/database/drunk_guesser_db.dart';

import '../api/product.dart';
import '../api/product_data.dart';
import 'category.dart';

class Entitlements {
  // stores whether ads are activated or not
  static bool showAds = true;

  static void setShowAds() async {
    showAds = await DrunkGuesserDB.getShowAds();
  }

  static Category zufall = Category(
    name: "Zufall (kostenlos)",
    dbName: "zufall",
    description:
        "Zufällige Fragen aus den Kategorien Unnützes Wissen, Medien und Unterhaltung, Sport, Geographie und Google.",
    iconPath: "assets/categories_icons/random_icon.png",
    purchased: true,
    colors: const [
      Color(0xffffffff),
      Color(0xffffffff),
    ],
  );
  static Category natur_und_tierwelt = Category(
    name: "Natur",
    dbName: "natur_und_tierwelt",
    description: "Fragen die sich rund um die Natur drehen",
    iconPath: "assets/categories_icons/nature_icon.png",
    colors: const [
      Color(0xff43c551),
      Color(0xff26a634),
    ],
    purchased: false,
  );
  static Category google = Category(
    name: "Google",
    dbName: "google",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/google_icon.png",
    colors: const [
      Color(0xffe5d858),
      Color(0xffcec137),
    ],
    purchased: false,
  );
  static Category geschichte = Category(
    name: "Geschichte",
    dbName: "geschichte",
    description: "Mischung aus 6 Kategorien",
    iconPath: "assets/categories_icons/history_icon.png",
    colors: const [
      Color(0xffa17147),
      Color(0xff79522f),
    ],
    purchased: false,
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
    purchased: false,
  );
  static Category preise = Category(
    name: "Preise",
    dbName: "preise",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/price_icon.png",
    colors: const [
      Color(0xff90c55c),
      Color(0xff4f732a),
    ],
    purchased: false,
  );
  static Category medien_und_unterhaltung = Category(
    name: "Medien & Unterhaltung",
    dbName: "medien_und_unterhaltung",
    description: "Mischung aus 6 Kategorien",
    iconPath: "assets/categories_icons/media_icon.png",
    colors: const [
      Color(0xffda87c2),
      Color(0xff935380),
    ],
    purchased: false,
  );
  static Category weltall = Category(
    name: "Weltall",
    dbName: "weltall",
    description: "Fragen die sich rund um die Natur drehen",
    iconPath: "assets/categories_icons/space_icon.png",
    colors: const [
      Color(0xffb668ef),
      Color(0xff7629a6),
    ],
    purchased: false,
  );
  static Category sport = Category(
    name: "Sport",
    dbName: "sport",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/sports_icon.png",
    colors: const [
      Color(0xffe8583f),
      Color(0xffc94832),
    ],
    purchased: false,
  );
  static Category unnuetzes_wissen = Category(
    name: "Unnützes Wissen",
    dbName: "unnuetzes_wissen",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/images/drunk_guesser_img.png",
    colors: const [
      Color(0xfff0a099),
      Color(0xffbb645d),
    ],
    purchased: false,
  );
  static Category achtzehn_plus = Category(
    name: "18+",
    dbName: "achtzehn_plus",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/18plus_icon.png",
    colors: const [
      Color(0xffee5555),
      Color(0xffd73b3b),
    ],
    purchased: false,
  );
  static Category geographie = Category(
    name: "Geographie",
    dbName: "geographie",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/geography_icon.png",
    colors: const [
      Color(0xff4d79da),
      Color(0xff1f49a4),
    ],
    purchased: false,
  );
  static Category mensch = Category(
    name: "Mensch",
    dbName: "mensch",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/mensch_icon.png",
    colors: const [
      Color(0xffefbf9d),
      Color(0xfff39f62),
    ],
    purchased: false,
  );
  static Category musik = Category(
    name: "Musik",
    dbName: "musik",
    description:
        "Schätze die Anzahl von Google-Suchergebnissen für bestimmte Google Suchanfragen",
    iconPath: "assets/categories_icons/music_icon.png",
    colors: const [
      Color(0xffb668ef),
      Color(0xff7629a6),
    ],
    purchased: false,
  );

  static List<Category> categoryList = [
    zufall,
    technik,
    natur_und_tierwelt,
    weltall,
    unnuetzes_wissen,
    achtzehn_plus,
    geographie,
    google,
    sport,
    medien_und_unterhaltung,
    musik,
    mensch,
    preise,
    geschichte,
  ];

  static Map<Category, Product> category_product_map = {
    technik: Products.technik,
    natur_und_tierwelt: Products.natur_und_tierwelt,
    weltall: Products.weltall,
    unnuetzes_wissen: Products.unnuetzes_wissen,
    achtzehn_plus: Products.achtzehn_plus,
    geographie: Products.geographie,
    google: Products.google,
    sport: Products.sport,
    medien_und_unterhaltung: Products.medien_und_unterhaltung,
    musik: Products.medien_und_unterhaltung,
    mensch: Products.mensch,
    preise: Products.preise,
    geschichte: Products.geschichte,
  };

  static List<Category> categoriesInZufall = [
    unnuetzes_wissen,
    medien_und_unterhaltung,
    sport,
    geographie,
    google,
  ];
}
