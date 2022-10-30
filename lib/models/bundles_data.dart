import '../api/product_data.dart';
import 'bundle.dart';

class Bundles {
  static Bundle bundle1 = Bundle(
    name: "Bundle 1",
    categoryNames: "Technik, Geographie, Weltall, Google, Sport",
    iconPath: "assets/categories_icons/random_icon.png",
    purchased: false,
    price: "1.99€",
    product: Products.bundle1,
  );
  static Bundle bundle2 = Bundle(
    name: "Bundle 2",
    categoryNames: "Unnützes Wissen, Natur und Tierwelt, 18+, Musik",
    iconPath: "assets/categories_icons/random_icon.png",
    purchased: false,
    price: "1.99€",
    product: Products.bundle2,
  );
  static Bundle bundle3 = Bundle(
    name: "Bundle 3",
    categoryNames: "Medien und Unterhaltung, Preise, Mensch, Geschichte",
    iconPath: "assets/categories_icons/random_icon.png",
    purchased: false,
    price: "1.99€",
    product: Products.bundle3,
  );
  static Bundle bundle4 = Bundle(
    name: "Bundle 4",
    categoryNames: "Technik, Unnuetzes Wissen, Preise, Mensch, Sport",
    iconPath: "assets/categories_icons/random_icon.png",
    purchased: false,
    price: "1.99€",
    product: Products.bundle4,
  );
  static Bundle bundle5 = Bundle(
    name: "Bundle 5",
    categoryNames: "Medien und Unterhaltung, Geographie, 18+, Google",
    iconPath: "assets/categories_icons/random_icon.png",
    purchased: false,
    price: "1.99€",
    product: Products.bundle5,
  );
  static Bundle bundle6 = Bundle(
    name: "Bundle 6",
    categoryNames: "Natur und Tierwelt, Musik, Weltall, Geschichte",
    iconPath: "assets/categories_icons/random_icon.png",
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
