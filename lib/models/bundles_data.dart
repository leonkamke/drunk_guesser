import '../api/product_data.dart';
import 'bundle.dart';

class Bundles {
  static Bundle bundle1 = Bundle(
    name: "Bundle 1",
    categoryNames: "Technik, Geographie, Weltall, Sport und Ernährung, Google",
    iconPath: "assets/bundles_icons/bundle_1_icons.png",
    purchased: false,
    price: "1.99€",
    product: Products.bundle1,
  );
  static Bundle bundle2 = Bundle(
    name: "Bundle 2",
    categoryNames: "Unnützes Wissen, Musik, Natur und Tierwelt, 18+",
    iconPath: "assets/bundles_icons/bundle_2_icons.png",
    purchased: false,
    price: "1.99€",
    product: Products.bundle2,
  );
  static Bundle bundle3 = Bundle(
    name: "Bundle 3",
    categoryNames: "Medien und Unterhaltung, Preise, Mensch, Geschichte und Kultur",
    iconPath: "assets/bundles_icons/bundle_3_icons.png",
    purchased: false,
    price: "1.99€",
    product: Products.bundle3,
  );
  static Bundle bundle4 = Bundle(
    name: "Bundle 4",
    categoryNames: "Technik, Mensch, Unnuetzes Wissen, Sport und Ernährung, Preise",
    iconPath: "assets/bundles_icons/bundle_4_icons.png",
    purchased: false,
    price: "1.99€",
    product: Products.bundle4,
  );
  static Bundle bundle5 = Bundle(
    name: "Bundle 5",
    categoryNames: "Medien und Unterhaltung, Google,  Geographie, 18+",
    iconPath: "assets/bundles_icons/bundle_5_icons.png",
    purchased: false,
    price: "1.99€",
    product: Products.bundle5,
  );
  static Bundle bundle6 = Bundle(
    name: "Bundle 6",
    categoryNames: "Weltall, Musik, Natur und Tierwelt, Geschichte und Kultur",
    iconPath: "assets/bundles_icons/bundle_6_icons.png",
    purchased: false,
    price: "1.99€",
    product: Products.bundle6,
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

  static List<Bundle> bundleList = [
    bundle1,
    bundle2,
    bundle3,
    bundle4,
    bundle5,
    bundle6,
  ];
}
