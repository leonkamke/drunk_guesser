import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  final String? text;
  final String assetPath;
  final void Function() onTap;
  final double borderRadius = 15;

  const IconButton(
      {Key? key,
      required this.text,
      required this.assetPath,
      required this.onTap})
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
            Image.asset(
              assetPath,
              height: 30,
            ),
            Text(
              text!,
              style: const TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF292F38),
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
