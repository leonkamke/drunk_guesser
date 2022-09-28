import 'package:auto_size_text/auto_size_text.dart';
import 'package:drunk_guesser/models/app_colors.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../database/drunk_guesser_db.dart';

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
  bool selected = false;

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
          height: displayHeight * 0.105,
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
                        color: AppColors.schirftFarbeCards,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Quicksand",
                      ),
                    ),
                    AutoSizeText(
                      maxLines: 3,
                      widget.category.description,
                      style: const TextStyle(
                        color: AppColors.schirftFarbeCards,
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
              Icon(
                Icons.check_circle_outline_rounded,
                size: 30,
                color: selected
                    ? const Color(0xff1e9d00)
                    : const Color(0x1affffff),
              ),
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
                  height: displayHeight * 0.105,
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
                                color: AppColors.schirftFarbeCards,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Quicksand",
                              ),
                            ),
                            AutoSizeText(
                              maxLines: 3,
                              widget.category.description,
                              style: const TextStyle(
                                color: AppColors.schirftFarbeCards,
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
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

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
          stops: [
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
          padding: EdgeInsets.symmetric(
              vertical: 3, horizontal: displayWidth * 0.07),
          margin: EdgeInsets.symmetric(
              vertical: 3, horizontal: displayWidth * 0.03),
          height: displayHeight * 0.105,
          width: displayWidth * 1,
          child: const Icon(
            Icons.lock_outline_rounded,
            size: 40,
          ),
        ),
      );
    }
  }

  void selectCategoryCard() {
    if (widget.category.purchased) {
      print("${widget.category.name} was tapped");
      setState(() {
        selected = !selected;
      });
    } else {
      print("category ${widget.category.name} is not purchased");
      // open shopScreen!
    }
  }

  void selectLock(BuildContext context) async {
    print("Open Shop");
    Navigator.of(context).pushNamed("/shop_main");
    // await DrunkGuesserDB.purchaseCategory(widget.category);
    // setState(() {});
  }
}
