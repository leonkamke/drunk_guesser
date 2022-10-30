import 'package:drunk_guesser/api/product.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseApi {
  static const _api_key = "goog_beJTTKPKogaHafsoNqvoXmdEzZv";

  static Future init() async {
    await Purchases.setDebugLogsEnabled(true);
    await Purchases.configure(PurchasesConfiguration(_api_key));

    List<StoreProduct> products = await Purchases.getProducts(["drunkguesser_18plus_0.69_lifetime"], type: PurchaseType.inapp);
  }
  
  static Future<List<StoreProduct>> fetchProducts() async {

    return [];
  }

  static Future<void> purchaseProduct(Product product) async {

    try {
      CustomerInfo customerInfo = await Purchases.purchaseProduct(product.id, type: PurchaseType.inapp);
      /*
      if (customerInfo.entitlements.all["my_entitlement_identifier"]!.isActive) {
        // save Purchased entitlements in sqlite database local on the device
        // set purchased attribute in categories_data
      }
       */
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        print(e.code);
        print(e.details);
        print(e.stacktrace);
      }
    }
  }



}