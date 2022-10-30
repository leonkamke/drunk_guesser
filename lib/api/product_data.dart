import 'package:drunk_guesser/api/product.dart';
import 'package:drunk_guesser/models/entitlements.dart';

class Products {
  /*
  Single category products:
   */
  static Product achtzehn_plus = Product(
    name: "18+",
    id: "drunkguesser_18plus_0.69_lifetime",
    categories: [Entitlements.achtzehn_plus],
  );
  static Product geographie = Product(
    name: "Geographie",
    id: "drunkguesser_geographie_0.69_lifetime",
    categories: [Entitlements.geographie],
  );
  static Product geschichte = Product(
    name: "Geschichte",
    id: "drunkguesser_geschichte_0.69_lifetime",
    categories: [Entitlements.geschichte],
  );
  static Product google = Product(
    name: "Google",
    id: "drunkguesser_google_0.69_lifetime",
    categories: [Entitlements.google],
  );
  static Product medien_und_unterhaltung = Product(
    name: "Medien und Unterhaltung",
    id: "drunkguesser_medienundunterhaltung_0.69_lifetime",
    categories: [Entitlements.medien_und_unterhaltung],
  );
  static Product mensch = Product(
    name: "Mensch",
    id: "drunkguesser_mensch_0.69_lifetime",
    categories: [Entitlements.mensch],
  );
  static Product musik = Product(
    name: "Musik",
    id: "drunkguesser_musik_0.69_lifetime",
    categories: [Entitlements.musik],
  );
  static Product natur_und_tierwelt = Product(
    name: "Natur und Tierwelt",
    id: "drunkguesser_naturundtierwelt_0.69_lifetime",
    categories: [Entitlements.natur_und_tierwelt],
  );
  static Product preise = Product(
    name: "Preise",
    id: "drunkguesser_preise_0.69_lifetime",
    categories: [Entitlements.preise],
  );
  static Product sport = Product(
    name: "Sport",
    id: "drunkguesser_sport_0.69_lifetime",
    categories: [Entitlements.sport],
  );
  static Product technik = Product(
    name: "Technik",
    id: "drunkguesser_technik_0.69_lifetime",
    categories: [Entitlements.technik],
  );
  static Product unnuetzes_wissen = Product(
    name: "Unnuetzes Wissen",
    id: "drunkguesser_unnuetzeswissen_0.69_lifetime",
    categories: [Entitlements.unnuetzes_wissen],
  );
  static Product weltall = Product(
    name: "Weltall",
    id: "drunkguesser_weltall_0.69_lifetime",
    categories: [Entitlements.weltall],
  );

  // -----------------------------------------------------------

  /*
  Bundle products
   */
  static Product bundle1 = Product(
    name: "Bundle 1",
    id: "drunkguesser_bundle1_1.99_lifetime",
    categories: [
      Entitlements.technik,
      Entitlements.geographie,
      Entitlements.weltall,
      Entitlements.google,
      Entitlements.sport,
    ],
  );
  static Product bundle2 = Product(
    name: "Bunlde 2",
    id: "drunkguesser_bundle2_1.99_lifetime",
    categories: [
      Entitlements.unnuetzes_wissen,
      Entitlements.natur_und_tierwelt,
      Entitlements.achtzehn_plus,
      Entitlements.musik,
    ],
  );
  static Product bundle3 = Product(
    name: "Bundle 3",
    id: "drunkguesser_bundle3_1.99_lifetime",
    categories: [
      Entitlements.medien_und_unterhaltung,
      Entitlements.preise,
      Entitlements.mensch,
      Entitlements.geschichte,
    ],
  );
  static Product bundle4 = Product(
    name: "Bundle 4",
    id: "drunkguesser_bundle4_1.99_lifetime",
    categories: [
      Entitlements.technik,
      Entitlements.unnuetzes_wissen,
      Entitlements.preise,
      Entitlements.mensch,
      Entitlements.sport,
    ],
  );
  static Product bundle5 = Product(
    name: "Bundle 5",
    id: "drunkguesser_bundle5_1.99_lifetime",
    categories: [
      Entitlements.medien_und_unterhaltung,
      Entitlements.geographie,
      Entitlements.achtzehn_plus,
      Entitlements.google,
    ],
  );
  static Product bundle6 = Product(
    name: "Bundle 6",
    id: "drunkguesser_bundle6_1.99_lifetime",
    categories: [
      Entitlements.natur_und_tierwelt,
      Entitlements.musik,
      Entitlements.weltall,
      Entitlements.geschichte,
    ],
  );

  /*
Bundle 1
    Technik, Geographie, Weltall, Google, Sport
Bundle 2
    Unnuetzes Wissen, Natur und Tierwelt, 18+, Musik
Bundle 3
    Medien und Unterhaltung, Preise, Mensch, Geschichte
Bundle 4
    Technik, Unnuetzes Wissen, Preise, Mensch, Sport
Bundle 5
    Medien und Unterhaltung, Geographie, 18+, Google
Bundle 6
    Natur und Tierwelt, Musik, Weltall, Geschichte
   */
  // -----------------------------------------------------------

  /*
  Fullversion product
   */
  static Product fullversion = Product(
    name: "Vollversion",
    id: "drunkguesser_fullversion_4.99_lifetime",
    categories: Entitlements.categoryList.getRange(1, Entitlements.categoryList.length).toList(),
  );
}
