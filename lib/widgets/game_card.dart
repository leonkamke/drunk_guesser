import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

import '../models/app_colors.dart';

class GameCard extends StatelessWidget {
  final String text;

  const GameCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      height: displayHeight * 0.5,
      child: Container(
        width: displayWidth * 0.8,
        height: displayHeight * 0.5,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: displayWidth * 0.05,
          vertical: displayWidth * 0.05,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
                color: Colors.black54, offset: Offset(3, 6), blurRadius: 6)
          ],
          color: AppColors.gameCard,
        ),
        child: AutoSizeText(
          text,
          key: ValueKey<String>(text),
          style: const TextStyle(
            color: AppColors.schriftFarbe_dunkel,
            fontFamily: "Quicksand",
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

/*
  Positioned(
                    top: displayHeight * 0.126,
                    left: displayWidth * 0.2,
                    child: Container(
                      width: displayWidth * 0.53,
                      height: displayWidth * 0.53,
                      child: const rive.RiveAnimation.asset(
                        'assets/animations/drunkguesser2.2.riv',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
   */
}
