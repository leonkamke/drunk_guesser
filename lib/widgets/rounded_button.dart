import 'package:flutter/material.dart';

import '../models/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final String buttonText;
  final Color firstColor;
  final Color secondColor;
  final double borderRadius;
  final void Function() onTap;

  /*
  Good colors:

  Color(0xE0FFA34B),
  Color(0xFFCC700F),

   */

  const RoundedButton({
    super.key,
    required this.buttonText,
    required this.firstColor,
    required this.secondColor,
    required this.borderRadius,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.black54, offset: Offset(3, 6), blurRadius: 6)
        ],
        color: firstColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          foregroundColor: const Color(0xFF94BfFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          fixedSize: const Size(200, 48),
        ),
        onPressed: onTap,
        child: FittedBox(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: "Quicksand",
              color: AppColors.buttonHomeScreenSchrift,
            ),
          ),
        ),
      ),
    );
  }
}
