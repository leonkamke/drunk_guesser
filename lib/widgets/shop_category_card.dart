import 'dart:async';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../api/product.dart';
import '../api/purchase_api.dart';
import '../models/app_colors.dart';
import '../models/category.dart';

class ShopCategoryCard extends StatefulWidget {
  ShopCategoryCard({
    Key? key,
    required this.category,
    required this.product,
  }) : super(key: key);

  final Category category;
  final Product product;

  @override
  State<ShopCategoryCard> createState() => _ShopCategoryCardState();
}

class _ShopCategoryCardState extends State<ShopCategoryCard> {
  bool blur = false;
  Duration animationDuration = const Duration(milliseconds: 1000);
  double spreadRadius = 0;
  double blurRadius = 2;
  late Timer _timer;

  _ShopCategoryCardState() {
    _timer = Timer.periodic(
      animationDuration,
          (timer) {
        setState(() {
          if (blur) {
            spreadRadius = 0;
            blurRadius = 2;
            blur = false;
          } else {
            spreadRadius = 3;
            blurRadius = 4;
            blur = true;
          }
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
                widget.category.iconPath,
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
                    widget.category.name,
                    style: const TextStyle(
                      color: Color(0xfffff8c0),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Quicksand",
                    ),
                  ),
                  AutoSizeText(
                    maxLines: 3,
                    widget.category.description,
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
                    spreadRadius: spreadRadius,
                    blurRadius: blurRadius,
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
    print("Buy category ${widget.category.name}");
    await PurchaseApi.purchaseProduct(widget.product);
  }
}
