import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/category_data.dart';
import '../widgets/shop_category_card.dart';

class ShopCategoriesScreen extends StatefulWidget {
  ShopCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<ShopCategoriesScreen> createState() => _ShopCategoriesScreenState();
}

class _ShopCategoriesScreenState extends State<ShopCategoriesScreen> {
  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFFFF6C6),
    ],
  ));

  late List<Category> categories;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    for (Category c in Categories.categoryList) {
      c.setPurchased();
    }
    categories = [...Categories.categoryList];

    // delete already purchased categories
    categories.removeWhere((category) => category.purchased == true);
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
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ShopCategoryCard(
                        category: categories[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: const Color(0xff292f38),
                      thickness: 1.5,
                      height: 23,
                      indent: displayWidth * 0.05,
                      endIndent: displayWidth * 0.05,
                    );
                    // return Container(width: 66, height: 2, color: const Color(0xBB292F38));
                  },
                  itemCount: categories.length),
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

- all categories:
technik
gegraphie
weltall
google
sport
unnuetzes_wissen
natur und tierwelt
18+
musik
medien und unterhaltung
mensch
preise
geschichte

- in zufall:
unnuetzes_wissen, medien und unterhaltung, geschichte, geographie, sport
 */
