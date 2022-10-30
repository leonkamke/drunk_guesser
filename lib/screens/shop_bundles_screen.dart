import 'package:drunk_guesser/models/bundle.dart';
import 'package:flutter/material.dart';

import '../models/bundles_data.dart';
import '../models/category.dart';
import '../models/entitlements.dart';
import '../widgets/shop_bundle_card.dart';

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
    for (Bundle b in Bundles.bundleList) {
      b.setPurchased();
    }

    // TODO: delete already purchased bundles
    //categories.removeWhere((category) => category.purchased == true);
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
                      Icons.undo_rounded,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ShopBundleCard(
                      bundle: Bundles.bundleList[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.transparent,
                      thickness: 0,
                      height: 23,
                    );
                    // return Container(width: 66, height: 2, color: const Color(0xBB292F38));
                  },
                  itemCount: Bundles.bundleList.length),
            ),
          ],
        ),
      ),
    );
  }
}

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
