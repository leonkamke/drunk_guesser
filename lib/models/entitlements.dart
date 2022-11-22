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
        "Zufällige Fragen aus den Kategorien Unnützes Wissen, Medien und Unterhaltung, Sport und Ernährung, Geographie und Google.",
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
    description: "Erkunde die Vielfältigkeit der Natur und Tierwelt aus einer anderen Perspektive.",
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
        "Ihr habt bestimmt noch nicht alles gegoogelt. Schätzt hier die Anzahl der Google-Ergebnisse für bestimmte Suchanfragen.",
    iconPath: "assets/categories_icons/google_icon.png",
    colors: const [
      Color(0xffe5d858),
      Color(0xffcec137),
    ],
    purchased: false,
  );
  static Category geschichte = Category(
    name: "Geschichte und Kultur",
    dbName: "geschichte",
    description: "Alles hat eine Geschichte. Schreibe deine eigene und gewinne in dieser Kategorie.",
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
    description: "Bist du technisch affin? Wie gut du dich wirklich auskennst, erfährst du hier.",
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
        "Was kostet die Welt? Hier wirst du es erfahren!",
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
    description: "Man darf die Macht der Medien nicht unterschätzen. Also schätze weise!",
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
    description: "Staunt über Zahlen und Fakten der Unendlichkeit des Weltalls.",
    iconPath: "assets/categories_icons/space_icon.png",
    colors: const [
      Color(0xff270c33),
      Color(0xff000000),
    ],
    purchased: false,
  );
  static Category sport = Category(
    name: "Sport und Ernährung",
    dbName: "sport",
    description:
        "Du bist Sportler durch und durch? Dann kannst du dein Fitnesswissen hier unter Beweis stellen!",
    iconPath: "assets/categories_icons/sports_icon.png",
    colors: const [
      Color(0xff2181ef),
      Color(0xff155493),
    ],
    purchased: false,
  );
  static Category unnuetzes_wissen = Category(
    name: "Unnützes Wissen",
    dbName: "unnuetzes_wissen",
    description:
        "Endlich ist dein Unnützes Wissen nützlich! Hier kannst du es deinen Freunden zeigen.",
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
    description: "Gewagte Fragen, die für eine gute Stimmung sorgen und dich und deine Freunde in Verlegenheit bringen!",
    iconPath: "assets/categories_icons/18plus_icon.png",
    colors: const [
      Color(0xfffc4545),
      Color(0xffc52d2d),
    ],
    purchased: false,
  );
  static Category geographie = Category(
    name: "Geographie",
    dbName: "geographie",
    description:
        "Wenn du denkst, dass du orientierungslos bist, dann hast du dich hier richtig verlaufen.",
    iconPath: "assets/categories_icons/geography_icon.png",
    colors: const [
      Color(0xff10b2be),
      Color(0xff0e858f),
    ],
    purchased: false,
  );
  static Category mensch = Category(
    name: "Mensch",
    dbName: "mensch",
    description:
        "Wie gut kennst du deinen Körper und Geist? Probiere es aus.",
    iconPath: "assets/categories_icons/human_icon.png",
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
        "Folge der Melodie deines Gedankenflusses und du wirst gut schätzen!",
    iconPath: "assets/categories_icons/music_icon.png",
    colors: const [
      Color(0xff9a35d9),
      Color(0xff65228f),
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
