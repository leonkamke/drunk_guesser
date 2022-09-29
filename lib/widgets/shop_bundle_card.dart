import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/app_colors.dart';
import '../models/bundle.dart';

class ShopBundleCard extends StatelessWidget {
  ShopBundleCard({Key? key, required this.bundle}) : super(key: key);

  final Bundle bundle;

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
            const AutoSizeText(
              "Enthält folgende Kategorien",
              style: TextStyle(
                color: Color(0xfffff8c0),
                fontSize: 19,
                fontWeight: FontWeight.bold,
                fontFamily: "Quicksand",
              ),
            ),
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  padding: const EdgeInsets.all(7),
                  child: Image.asset(
                    bundle.iconPath,
                    height: 10,
                    fit: BoxFit.contain,
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
                        bundle.categoryNames,
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
                      Container(
                        padding: EdgeInsets.fromLTRB(displayWidth*0.05, displayHeight*0.02, displayWidth*0.05, displayHeight*0.013),
                        decoration: BoxDecoration(
                          color: AppColors.shopPriceButtonBackground,
                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: Text(
                          bundle.price,
                          style: const TextStyle(
                            color: AppColors.shopPriceButtonSchrift,
                            fontSize: 30,
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
    print("Buy bundle ${bundle.categoryNames}");
  }
}
