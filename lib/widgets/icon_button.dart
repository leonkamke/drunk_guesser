import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  final String text;
  final String assetPath;
  final void Function() onTap;

  const IconButton({Key? key, required this.text, required this.assetPath, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Image.asset(assetPath, scale: 1.3),
          onTap: onTap,
        ),
        Text(
          text,
          style: TextStyle(
              fontFamily: "Quicksand",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xE0443E38)),
        )
      ],
    );
  }
}
