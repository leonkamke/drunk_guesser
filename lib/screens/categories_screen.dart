import 'package:drunk_guesser/models/background_icons.dart';
import 'package:drunk_guesser/widgets/category_card.dart';
import 'package:drunk_guesser/widgets/categories_startbutton.dart';
import 'package:drunk_guesser/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

import '../models/app_colors.dart';
import '../models/category.dart';
import '../models/entitlements.dart';
import '../provider/categories_startbutton_provider.dart';

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

  late List<Category> categories;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    // context.read<StartButtonProvider>().setEnabled(true);
    StartButtonProvider.buttonDisabled = true;
    for (Category c in Entitlements.categoryList) {
      c.setPurchased();
    }
    // Check wether to show ads
    Entitlements.setShowAds();
    // Copy list of all categories
    categories = [...Entitlements.categoryList];
    // Set selected value to false
    categories.forEach((element) => element.selected = false);
    // sort CategoryList (purchased categories first)
    categories.sort(
      (a, b) {
        if (a.purchased == true && b.purchased == false) {
          return -1;
        } else if (a.purchased == false && b.purchased == true) {
          return 1;
        } else {
          return 0;
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // Check wether to show ads
    Entitlements.setShowAds();
    // Copy list of all categories
    categories = [...Entitlements.categoryList];
    // Set selected value to false
    categories.forEach((element) => element.selected = false);
    // sort CategoryList (purchased categories first)
    categories.sort(
      (a, b) {
        if (a.purchased == true && b.purchased == false) {
          return -1;
        } else if (a.purchased == false && b.purchased == true) {
          return 1;
        } else {
          return 0;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the padding of the safe area
    EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;

    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height - safeAreaPadding.top - safeAreaPadding.bottom;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: displayWidth,
        height: displayHeight,
        decoration: backgroundDecoration,
        child: Stack(
          children: [
            ...BackgroundIcons.getImages(context),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0)),
                    boxShadow: [
                      /*BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, 3),
                          blurRadius: 6)
                       */
                    ],
                    color: Colors.transparent, //AppColors.appbarBackground,
                  ),
                  padding: EdgeInsets.fromLTRB(
                    displayWidth * 0.065,
                    displayHeight * 0.02,
                    displayWidth * 0.065,
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
                            color: AppColors.shopPriceButtonSchrift,
                            //AppColors.appbarBackground,//AppColors.appBarText,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.home_rounded,
                          size: 40,
                          color: AppColors.appBarText
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 15),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CategoryCard(category: categories[index]);
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: AppColors.gameCard,
                          //AppColors.categoryDivider,
                          thickness: 1.5,
                          height: 23,
                          //32,
                          indent: displayWidth * 0.05,
                          endIndent: displayWidth * 0.05,
                        );
                      },
                      itemCount: categories.length),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    /*
                    boxShadow: [

                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, -3),
                          blurRadius: 4)
                    ],*/
                    color: AppColors.appbarBackground,
                  ),
                  width: displayWidth,
                  height: displayHeight * 0.09,
                  child: StartButton(
                    onTap: () => startGame(context),
                    textColor: Colors.white,
                    borderRadius: 10,
                    buttonText: "Start",
                    firstColor: AppColors.schriftFarbe_hell,
                    secondColor: AppColors.schriftFarbe_hell,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void startGame(BuildContext context) {
    print("Game starts...");
    // iterate over all categoryCards and check which are selected

    List<Category> selectedCategories = [];
    if (Entitlements.zufall.selected) {
      // If Zufall is selected
      // Add categories which are in zufall
      selectedCategories.addAll(Entitlements.categoriesInZufall);
      for (Category c in categories) {
        if (c.selected && !selectedCategories.contains(c)) {
          selectedCategories.add(c);
        }
      }
      selectedCategories.remove(Entitlements.zufall);
    } else {
      selectedCategories = categories
          .where((element) =>
              element.selected == true && element.purchased == true)
          .toList();
    }
    for (Category c in selectedCategories) {
      print(c.dbName);
    }
    // Load this categories for the game
    Navigator.of(context)
        .pushReplacementNamed("/game_start", arguments: selectedCategories);
  }
}
