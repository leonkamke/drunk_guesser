import 'package:flutter/material.dart';

import '../models/app_colors.dart';
import '../models/category_data.dart';
import '../widgets/shop_category_card.dart';

class ShopCategoriesScreen extends StatelessWidget {
  ShopCategoriesScreen({Key? key}) : super(key: key);

  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFFFF6C6),
    ],
  ));

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: displayWidth,
        height: displayHeight,
        decoration: backgroundDecoration,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                displayWidth * 0.1,
                displayHeight * 0.06,
                displayWidth * 0.1,
                0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "Shop",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF292F38),
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.close_rounded,
                      size: 36,
                      color: Color(0xff292f38),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ShopCategoryCard(
                        category: Categories.categoryList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.categoryDivider,
                      thickness: 2,
                      height: 16,
                      indent: displayWidth * 0.05,
                      endIndent: displayWidth * 0.05,
                    );
                    // return Container(width: 66, height: 2, color: const Color(0xBB292F38));
                  },
                  itemCount: Categories.categoryList.length),
            ),
          ],
        ),
      ),
    );
  }
}
