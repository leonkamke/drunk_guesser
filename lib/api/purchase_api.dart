import 'package:drunk_guesser/api/product.dart';
import 'package:drunk_guesser/database/drunk_guesser_db.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseApi {
  static const _api_key = "goog_beJTTKPKogaHafsoNqvoXmdEzZv";

  static Future init() async {
    await Purchases.setDebugLogsEnabled(true);
    await Purchases.configure(PurchasesConfiguration(_api_key));

    List<StoreProduct> products = await Purchases.getProducts(
        ["drunkguesser_18plus_0.69_lifetime"],
        type: PurchaseType.inapp);
  }

  static Future<List<StoreProduct>> fetchProducts() async {
    return [];
  }

  static Future<void> purchaseProduct(Product product) async {
    try {
      CustomerInfo customerInfo =
          await Purchases.purchaseProduct(product.id, type: PurchaseType.inapp);
      // save Purchased entitlements in sqlite database local on the device and set purchased attribute in categories_data
      await DrunkGuesserDB.purchaseCategories(product.categories);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        print(e.code);
        print(e.details);
        print(e.stacktrace);
      }
    }
  }

  static Future<void> getEntitlements() async {
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();
    Iterable<EntitlementInfo> list = customerInfo.entitlements.all.values
        .where((element) => element.isActive);
    print("---------------------------");
    for (EntitlementInfo e in list) {
      print(e.identifier);
    }
  }
}
