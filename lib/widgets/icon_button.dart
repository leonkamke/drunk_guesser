import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  final String text;
  final String assetPath;
  final void Function() onTap;

  const IconButton({Key? key, required this.text, required this.assetPath, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(assetPath, height: displayHeight * 0.045,),
        ),
        Text(
          text,
          style: const TextStyle(
              fontFamily: "Quicksand",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xE0443E38)),
        )
      ],
    );
  }
}
