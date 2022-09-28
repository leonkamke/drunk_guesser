import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/app_colors.dart';
import '../models/category.dart';

class ShopCategoryCard extends StatelessWidget {
  ShopCategoryCard({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: buyCategory,
      child: Container(
        padding:
            EdgeInsets.symmetric(vertical: 3, horizontal: displayWidth * 0.03),
        margin:
            EdgeInsets.symmetric(vertical: 3, horizontal: displayWidth * 0.03),
        height: displayHeight * 0.105,
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
            const FittedBox(
              child: Text(
                "0.69€",
                style: TextStyle(
                  color: Color(0xfffff8c0),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void buyCategory() {
    print("Buy category ${category.name}");
  }

}