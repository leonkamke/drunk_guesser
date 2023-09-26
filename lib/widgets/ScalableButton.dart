import 'package:flutter/material.dart';

class ScalableButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const ScalableButton({
    super.key,
    required this.onPressed,
    required this.child,
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
        child: widget.child,
      ),
    );
  }
}