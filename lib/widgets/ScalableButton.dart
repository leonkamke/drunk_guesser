import 'package:flutter/material.dart';

import '../models/app_colors.dart';

class ScalableButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  const ScalableButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.color,
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
        child: Container(width: 180, height: 50, color: widget.color),
      ),
    );
  }
}
