import 'package:flutter/material.dart';

import '../models/app_colors.dart';

class IconButton extends StatelessWidget {
  final String? text;
  final Icon icon;
  final void Function() onTap;
  final double borderRadius = 15;
  final Color textColor;

  const IconButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onTap,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: const Color(0x80a5d7),
        child: Column(
          children: [
            icon,
            Text(
              text!,
              style: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  /*shadows: [
                    Shadow(
                      offset: Offset(2.2, 3.2),
                      blurRadius: 9,
                      color: Colors.black54,
                    ),
                  ]*/),
            )
          ],
        ),
      ),
    );
  }
}
