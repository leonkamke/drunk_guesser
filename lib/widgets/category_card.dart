import 'package:auto_size_text/auto_size_text.dart';
import 'package:drunk_guesser/models/app_colors.dart';
import 'package:drunk_guesser/provider/categories_startbutton_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../database/drunk_guesser_db.dart';
import '../models/category_data.dart';

class CategoryCard extends StatefulWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  /*
   True if user wants to use this category in the game, else false.
   If true render checkmark in green, else render in transparent grey.
   */

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    if (widget.category.purchased) {
      return GestureDetector(
        onTap: selectCategoryCard,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: 3, horizontal: displayWidth * 0.03),
          margin: EdgeInsets.symmetric(
              vertical: 3, horizontal: displayWidth * 0.03),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.iconBackground,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0, 3),
                        blurRadius: 6)
                  ],
                ),
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
                        color: AppColors.schriftFarbeCards,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Quicksand",
                      ),
                    ),
                    AutoSizeText(
                      widget.category.description,
                      style: const TextStyle(
                        color: AppColors.schriftFarbeCards,
                        fontSize: 9,
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
              widget.category.selected
                  ? const Icon(
                      Icons.check_circle_rounded,
                      size: 30,
                      color: AppColors.selected,
                    )
                  : const Icon(
                      Icons.circle,
                      size: 30,
                      color: Color(0x45ffffff),
                    ),
              /*
              Icon(
                Icons.check_circle_outline_rounded,
                size: 30,
                color: widget.category.selected
                    ? AppColors.selected
                    : const Color(0x1affffff),
              ),*/
            ],
          ),
        ),
        //getLockContainer(),
      );
    } else {
      return Stack(
        children: [
          GestureDetector(
            onTap: () => selectLock(context),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 3, horizontal: displayWidth * 0.03),
                  margin: EdgeInsets.symmetric(
                      vertical: 3, horizontal: displayWidth * 0.03),
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.iconBackground,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(0, 3),
                                blurRadius: 6)
                          ],
                        ),
                        child: setImageTransparent(),
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
                                color: AppColors.schriftFarbeCardsTransparent,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Quicksand",
                              ),
                            ),
                            AutoSizeText(
                              maxLines: 3,
                              widget.category.description,
                              style: const TextStyle(
                                color: AppColors.schriftFarbeCardsTransparent,
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
                    ],
                  ),
                ),
                /*
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xd2292f38),
                ),
                height: 2,
                width: displayWidth * 0.9,
              ),*/
              ],
            ),
          ),
          getLockContainer(),
        ],
      );
    }
  }

  Widget setImageTransparent() {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.black.withOpacity(0.09),
            Colors.black.withOpacity(0.15),
            Colors.black.withOpacity(0.15),
            Colors.black.withOpacity(0.09),
            // <-- change this opacity
            // Colors.transparent // <-- you might need this if you want full transparency at the edge
          ],
          stops: const [
            0.0,
            0.5,
            0.55,
            1.0,
          ], //<-- the gradient is interpolated, and these are where the colors above go into effect (that's why there are two colors repeated)
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: Image.asset(
        widget.category.iconPath,
        height: 10,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget getLockContainer() {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    if (widget.category.purchased) {
      return Container();
    } else {
      return GestureDetector(
        onTap: () => selectLock(context),
        child: Container(
          // padding: EdgeInsets.symmetric(
             // vertical: 20, horizontal: displayWidth * 0.07),
          margin: EdgeInsets.symmetric(
              vertical: 3, horizontal: displayWidth * 0.03),
          height: displayHeight * 0.105,
          width: displayWidth * 1,
          alignment: Alignment.center,
          child: SizedBox(
            width: displayHeight * 0.061
            ,
            height: displayHeight * 0.061,
            child: Image.asset(
              "assets/icons/lock_icon.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    }
  }

  void selectCategoryCard() {
    if (widget.category.purchased) {
      print("${widget.category.name} was tapped");
      setState(() {
        widget.category.selected = !widget.category.selected;
      });
    }
    bool value = true;
    for (Category c in Categories.categoryList) {
      if (c.selected) {
        value = false;
      }
    }
    context.read<StartButtonProvider>().setEnabled(value);
  }

  void selectLock(BuildContext context) async {
    print("Open Shop");
    Navigator.of(context).pushNamed("/shop_main");
    // await DrunkGuesserDB.purchaseCategory(widget.category);
    // setState(() {});
  }
}
