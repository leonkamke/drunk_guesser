import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String buttonText;
  final Color firstColor;
  final Color secondColor;
  final Color onClickColor;
  final double borderRadius;
  final Color textColor;
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
    required this.onClickColor,
    required this.borderRadius,
    required this.textColor,
    required this.onTap,
  });

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool _isPressed = false;
  Duration animationDuration = const Duration(milliseconds: 73);

  void buttonPressed() async {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  Future<void> onEnd() async {
    setState(() {
      _isPressed = false;
    });
    await Future.delayed(animationDuration).then(
      (value) {
        widget.onTap();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    // final displayHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      // onTap: buttonPressed,
      onTapDown: (x) => {
        buttonPressed(),
        print(x.globalPosition.toString())
      },
      onHorizontalDragEnd: (x) => {
        onEnd()
      },
      onVerticalDragEnd: (x) => {
        onEnd()
      },
      onTapUp: (x) => {onEnd()},
      child: AnimatedContainer(
        curve: Curves.ease,
        duration: animationDuration,
        decoration: BoxDecoration(
          boxShadow: !_isPressed
              ? [
                  const BoxShadow(
                      color: Colors.black54,
                      offset: Offset(3, 6),
                      blurRadius: 6)
                ]
              : [
                  const BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.7, 2.1),
                      blurRadius: 1.2)
                ],
          color: widget.firstColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: widget.firstColor,
            splashFactory: NoSplash.splashFactory,
            foregroundColor: widget.onClickColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            backgroundColor: widget.firstColor,
            shadowColor: Colors.transparent,
            fixedSize: /* !_isPressed
                ? Size(displayWidth * 0.48, 48)
                : Size(displayWidth * 0.46, 46)*/
                Size(displayWidth * 0.48, 48),
          ),
          onPressed: null,
          child: FittedBox(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "Quicksand",
                color: widget.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
