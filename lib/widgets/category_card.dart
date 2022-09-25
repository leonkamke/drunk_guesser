import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';

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

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            print(widget.category.name + "was tapped");
            setState(() {
              selected = !selected;
            });
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: 0, horizontal: displayWidth * 0.07),
                color: Colors.transparent,
                height: displayHeight * 0.105,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff444e5a),
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
                        children: [
                          Text(
                            widget.category.name,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand",
                            ),
                          ),
                          AutoSizeText(
                            maxLines: 3,
                            widget.category.description,
                            style: const TextStyle(
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xd2292f38),
                ),
                height: 2,
                width: displayWidth * 0.9,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
