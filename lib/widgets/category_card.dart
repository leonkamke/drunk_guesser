import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String description;
  final String iconPath;

  /*
  If false then the card is grey, and has a lock in front of it.
   */
  bool purchased = false;

  /*
   True if user wants to use this category in the game, else false.
   If true render checkmark in green, else render in transparent grey.
   */
  bool selected = false;

  CategoryCard({
    Key? key,
    required this.name,
    required this.description,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => print(name + "was tapped"),
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: displayHeight * 0.105,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: Image.asset(
                      iconPath,
                      height: 10,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 10),
                  ),
                  const Icon(
                    Icons.check_circle_outline_rounded,
                    size: 30,
                  ),
                ],
              ),
            ),
            Container(height: 2, color: const Color(0xd2292f38),)
          ],
        ),
      ),
    );
  }
}
