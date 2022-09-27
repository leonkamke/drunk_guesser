import 'package:drunk_guesser/database/drunk_guesser_db.dart';
import 'package:drunk_guesser/widgets/category_card.dart';
import 'package:drunk_guesser/widgets/categories_startbutton.dart';
import 'package:flutter/material.dart';

import '../models/app_colors.dart';
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
      AppColors.background_1,
      AppColors.background_2,
    ],
  ));

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    for (Category c in Categories.categoryList) {
      c.setPurchased();
    }
    // sort CategoryList (purchased categories first)
    sortCategoryCards();
  }

  void sortCategoryCards() {
    setState(() {
      Categories.categoryList.sort(
        (a, b) {
          if (a.purchased == true && b.purchased == false) {
            return -11;
          } else if (a.purchased == false && b.purchased == true) {
            return 1;
          } else {
            return 0;
          }
        },
      );
    });
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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
                color: AppColors.appbarBackground,
              ),
              padding: EdgeInsets.fromLTRB(
                displayWidth * 0.1,
                displayHeight * 0.05,
                displayWidth * 0.1,
                displayHeight * 0.025,
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
                        color: AppColors.schriftFarbe_hell,
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.home_rounded,
                      size: 45,
                      color: AppColors.schriftFarbe_hell,
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
                    return CategoryCard(
                        category: Categories.categoryList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.categoryDivider,
                      thickness: 2,
                      height: 5,
                      indent: displayWidth * 0.05,
                      endIndent: displayWidth * 0.05,
                    );
                    // return Container(width: 66, height: 2, color: const Color(0xBB292F38));
                  },
                  itemCount: Categories.categoryList.length),
            ),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0, -3),
                      blurRadius: 6)
                ],
                color: AppColors.appbarBackground,
              ),
              width: displayWidth,
              height: displayHeight * 0.09,
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
