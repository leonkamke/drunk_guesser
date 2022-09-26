import 'package:drunk_guesser/database/drunk_guesser_db.dart';
import 'package:drunk_guesser/widgets/category_card.dart';
import 'package:drunk_guesser/widgets/categories_startbutton.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/category_data.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key? key}) : super(key: key) {
    // load purchased from device sqlite database
    // sort category_cards
  }

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF80A5D7),
      Color(0xFF6B9EE3),
    ],
  ));


  @override
  void initState() {
    // TODO: implement initState
    for (Category c in Categories.categoryList) {
      DrunkGuesserDB.categoryPurchased(c).then((value) => c.purchased = value);
    }
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
                displayHeight * 0.035,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "Kategorien",
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
                      Icons.home_rounded,
                      size: 45,
                      color: Color(0xFF292F38),
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
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CategoryCard(
                        category: Categories.categoryList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Color(0x9e292f38),
                      thickness: 2,
                      height: 5,
                      indent: displayWidth * 0.05,
                      endIndent: displayWidth * 0.05,
                    );
                    // return Container(width: 66, height: 2, color: const Color(0xBB292F38));
                  },
                  itemCount: Categories.categoryList.length),
              /*
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  CategoryCard(category: Categories.zufall),
                  CategoryCard(category: Categories.natur),
                  CategoryCard(category: Categories.google),
                  CategoryCard(category: Categories.geschichte),
                  CategoryCard(category: Categories.technik),
                  CategoryCard(category: Categories.preise),
                  CategoryCard(category: Categories.medien),
                  CategoryCard(category: Categories.weltall),
                  CategoryCard(category: Categories.sport),
                  CategoryCard(category: Categories.unnuetzes_wissen),
                  CategoryCard(category: Categories.eightteen_plus),
                  CategoryCard(category: Categories.geographie),
                  CategoryCard(category: Categories.mensch),
                  CategoryCard(category: Categories.musik),
                ],
              ),*/
            ),
            Container(
              width: displayWidth,
              height: displayHeight * 0.09,
              color: const Color(0xff292f38),
              child: Center(
                child: StartButton(
                  onTap: () => startGame(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startGame() {
    print("start the game");
    // iterate over all categoryCards and check which are selected
    // -> load this categories for game
    // push GameScreen
    DrunkGuesserDB.deleteDB();
  }
}
