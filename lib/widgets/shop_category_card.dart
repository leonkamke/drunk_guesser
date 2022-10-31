import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../api/product.dart';
import '../api/purchase_api.dart';
import '../models/app_colors.dart';
import '../models/category.dart';

class ShopCategoryCard extends StatelessWidget {
  ShopCategoryCard({
    Key? key,
    required this.category,
    required this.product,
  }) : super(key: key);

  final Category category;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: buyCategory,
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: 8, horizontal: displayWidth * 0.03),
        margin:
            EdgeInsets.symmetric(vertical: 3, horizontal: displayWidth * 0.03),
        decoration: BoxDecoration(
          color: const Color(0xff444e5a),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              padding: const EdgeInsets.all(7),
              child: Image.asset(
                category.iconPath,
                height: 10,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: displayWidth * 0.05,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category.name,
                    style: const TextStyle(
                      color: Color(0xfffff8c0),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Quicksand",
                    ),
                  ),
                  AutoSizeText(
                    maxLines: 3,
                    category.description,
                    style: const TextStyle(
                      color: Color(0xfffff8c0),
                      fontSize: 11,
                      // fontWeight: FontWeight.bold,
                      fontFamily: "Quicksand",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: displayWidth * 0.05,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  displayWidth * 0.03,
                  displayHeight * 0.019,
                  displayWidth * 0.035,
                  displayHeight * 0.013),
              decoration: BoxDecoration(
                color: AppColors.shopPriceButtonBackground,
                border: Border.all(
                  color: const Color(0xff444e5a),
                  width: displayWidth * 0.005,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shopPriceButtonShadow,
                    spreadRadius: 2,
                    blurRadius: 4,
                    //blurStyle: BlurStyle.outer,
                  )
                ],
              ),
              child: const Text(
                "0.69€",
                style: TextStyle(
                  color: AppColors.shopPriceButtonSchrift,
                  fontSize: 19,
                  height: 0.9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> buyCategory() async {
    print("Buy category ${category.name}");
    await PurchaseApi.purchaseProduct(product);
  }
}
