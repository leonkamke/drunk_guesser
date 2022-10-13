import 'package:flutter/material.dart';

class BackgroundIcons {
  static List<Widget> getImages(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    double iconHeight = displayWidth * 0.182;
    Color iconColor = Color(0xB000000);
    return [
      Positioned(
        top: displayHeight * 0.05,
        left: displayWidth * 0.1,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        top: displayHeight * 0.09,
        left: displayWidth * 0.5,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        top: displayHeight * 0.28,
        left: displayWidth * 0.04,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        top: displayHeight * 0.32,
        left: displayWidth * 0.8,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),

      // ----------------

      Positioned(
        bottom: displayHeight * 0.05,
        right: displayWidth * 0.1,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        bottom: displayHeight * 0.09,
        right: displayWidth * 0.5,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        bottom: displayHeight * 0.28,
        right: displayWidth * 0.04,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        bottom: displayHeight * 0.32,
        right: displayWidth * 0.8,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        bottom: displayHeight * 0.02,
        right: displayWidth * 0.8,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
    ];
  }
}