import 'package:auto_size_text/auto_size_text.dart';
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
                      color: const Color(0xFFF6F6F6),
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
                            color: Color(0xFF292F38),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Quicksand",
                          ),
                        ),
                        AutoSizeText(
                          maxLines: 3,
                          widget.category.description,
                          style: const TextStyle(
                            color: Color(0xFF292F38),
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
        //getLockContainer(),
      );
    } else {
      return Stack(
        children: [
          GestureDetector(
            onTap: selectCategoryCard,
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
                          color: const Color(0xFFF6F6F6),
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
                                color: Color(0xFF292F38),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Quicksand",
                              ),
                            ),
                            AutoSizeText(
                              maxLines: 3,
                              widget.category.description,
                              style: const TextStyle(
                                color: Color(0xFF292F38),
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
          /*decoration: BoxDecoration(
            color: Color(0x96292F38),
            borderRadius: BorderRadius.circular(15),
          ),*/
          child: const Icon(
            Icons.lock_outline_rounded,
            size: 30,
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
    Navigator.of(context).pushNamed("/shop");
    // await DrunkGuesserDB.purchaseCategory(widget.category);
    // setState(() {});
  }
}
