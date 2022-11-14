import 'package:auto_size_text/auto_size_text.dart';
import 'package:drunk_guesser/api/purchase_api.dart';
import 'package:flutter/material.dart';

import '../models/app_colors.dart';
import '../models/bundle.dart';
import '../screens/shop_bundles_screen.dart';

class ShopBundleCard extends StatefulWidget {
  ShopBundleCard({Key? key, required this.bundle}) : super(key: key);

  final Bundle bundle;

  @override
  State<ShopBundleCard> createState() => _ShopBundleCardState();
}

class _ShopBundleCardState extends State<ShopBundleCard> {
  Duration animationDuration = const Duration(milliseconds: 700);

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: buyBundle,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: displayHeight * 0.015, horizontal: displayWidth * 0.04),
        margin:
            EdgeInsets.symmetric(vertical: 3, horizontal: displayWidth * 0.03),
        decoration: BoxDecoration(
          color: const Color(0xff444e5a),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              widget.bundle.name,
              style: const TextStyle(
                color: Color(0xfffff8c0),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Quicksand",
              ),
            ),
            Row(
              children: [
                Container(
                  //color: Colors.black,
                  width: 125,
                  height: 165,
                  //padding: const EdgeInsets.all(2),
                  child: Image.asset(
                    widget.bundle.iconPath,
                    //height: 10,
                    //fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: displayHeight * 0.03,
                      ),
                      AutoSizeText(
                        "Enthält folgende Kategorien:\n${widget.bundle.categoryNames}",
                        style: const TextStyle(
                          color: Color(0xfffff8c0),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Quicksand",
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: displayHeight * 0.06,
                      ),
                      AnimatedContainer(
                        duration: animationDuration,
                        curve: Curves.fastOutSlowIn,
                        padding: EdgeInsets.fromLTRB(
                            displayWidth * 0.03,
                            displayHeight * 0.019,
                            displayWidth * 0.035,
                            displayHeight * 0.013),
                        decoration: BoxDecoration(
                          // color: Color(0xffffdb27),//AppColors.shopPriceButtonBackground,
                          gradient: const LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [
                                Color(0xffffcc00),
                                Color(0xfffff5b6),
                              ]),
                          border: Border.all(
                            color: const Color(0xff444e5a),
                            width: displayWidth * 0.005,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffffe45b), //AppColors.shopPriceButtonShadow,
                              spreadRadius: ShopBundlesScreen.spreadRadius,
                              blurRadius: ShopBundlesScreen.blurRadius,
                              //blurStyle: BlurStyle.outer,
                            )
                          ],
                        ),
                        child: Text(
                          widget.bundle.price,
                          style: const TextStyle(
                            color: AppColors.shopPriceButtonSchrift,
                            fontSize: 19,
                            height: 0.9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: displayHeight * 0.015,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void buyBundle() {
    print("Buy bundle ${widget.bundle.categoryNames}");
    PurchaseApi.purchaseProduct(widget.bundle.product);
  }
}
