import 'package:flutter/material.dart';

import '../models/app_colors.dart';

class ScalableButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Color color;
  final String text;

  const ScalableButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.text,
  });

  @override
  ScalableButtonState createState() => ScalableButtonState();
}

class ScalableButtonState extends State<ScalableButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Transform.scale(
        scale: isPressed ? 0.95 : 1.0, // Adjust the scale factor as needed
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            // Adjust the radius as needed
            color: widget.color,
            border: Border.all(
              color: Colors.black, // Set the border color to black
              width: 2.3, // Set the border width
            ),
          ),
          width: 180,
          height: 50,
          child: Center(child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              fontFamily: "Quicksand",
              color: AppColors.drunkguesserSchrift,
            ),
          )),),
      ),
    );
  }
}
