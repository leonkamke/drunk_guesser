import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/category_data.dart';

class ShopBundlesScreen extends StatefulWidget {
  const ShopBundlesScreen({Key? key}) : super(key: key);

  @override
  State<ShopBundlesScreen> createState() => _ShopBundlesScreenState();
}

class _ShopBundlesScreenState extends State<ShopBundlesScreen> {
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
  void initState() {
    super.initState();
    // TODO: implement initState

  }

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
                displayHeight * 0.02,
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
          ],
        ),
      ),
    );
  }
}
