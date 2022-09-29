import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/app_colors.dart';
import '../models/category.dart';

class GameStartScreen extends StatelessWidget {
  GameStartScreen({Key? key}) : super(key: key);

  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.backgroundHomeScreen_1,
      AppColors.backgroundHomeScreen_2,
    ],
  ));


  void initGame(BuildContext context) {
    // Get selectedCategories
    List<Category> selectedCategories =
    ModalRoute.of(context)?.settings.arguments as List<Category>;
    // Print selected categories
    for (Category c in selectedCategories) {
      print(c.name);
    }
    //TODO: Get questions via SQLite query
  }

  @override
  Widget build(BuildContext context) {
    initGame(context);
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: displayWidth,
        height: displayHeight,
        decoration: backgroundDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: displayWidth * 0.05,
                vertical: displayWidth * 0.05,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(3, 6),
                      blurRadius: 6)
                ],
                color: AppColors.gameCard,
              ),
              width: displayWidth * 0.8,
              height: displayHeight * 0.5,
              child: AutoSizeText(
                startText,
                style: const TextStyle(
                  color: AppColors.schriftFarbe_dunkel,
                  fontFamily: "Quicksand",
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final String startText =
      "Holt eure Notitzen auf dem Handy raus und es kann losgehen!\n\nWer am schlechtesten schätzt trinkt!\n\nViel Spaß!";
}
