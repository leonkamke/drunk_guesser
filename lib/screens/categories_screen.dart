import 'package:drunk_guesser/widgets/category_card.dart';
import 'package:drunk_guesser/widgets/categories_startbutton.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF80A5D7),
      Color(0xFF6B9EE3),
    ],
  ));

  CategoryCard testCard = CategoryCard(
      name: "Zufall (kostenlos)",
      description: "Mischung aus 6 Kategorien",
      iconPath: "assets/categories_icons/random_icon.png");

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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Image.asset(
                      "assets/icons/home_icon_dark.png",
                      height: 30,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                children: [
                  testCard,
                  testCard,
                  testCard,
                  testCard,
                  testCard,
                  testCard,
                  testCard,
                  testCard,
                  testCard,
                  testCard,
                  testCard,
                  testCard,
                  testCard,
                  testCard,
                  testCard,
                ],
              ),
            ),
            Container(
              width: displayWidth,
              height: displayHeight * 0.1,
              color: const Color(0xff292f38),
              child: Center(
                child: StartButton(
                  onTap: () => print("start the game"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
