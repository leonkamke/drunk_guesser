import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedButton extends StatefulWidget {
  final String buttonText;
  final Color firstColor;
  final Color secondColor;
  final Color onClickColor;
  final double borderRadius;
  final Color textColor;
  final void Function() onTap;

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
  bool _nextScreen = false;
  Duration animationDuration = const Duration(milliseconds: 50);

  void buttonPressed() async {
    setState(() {
      _isPressed = !_isPressed;
    });
    _nextScreen = true;
  }

  Future<void> onEnd() async {
    setState(() {
      _isPressed = false;
    });
    await Future.delayed(animationDuration).then(
      (value) async {
        if (_nextScreen) {
          widget.onTap();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      // onTap: buttonPressed,
      onTapDown: (x) => {buttonPressed()},
      onTapUp: (x) => {onEnd()},
      onTapCancel: () {
        setState(() {
          _isPressed = false;
          _nextScreen = false;
        });
      },
      child: AnimatedContainer(
        curve: Curves.ease,
        duration: animationDuration,
        decoration: BoxDecoration(
          boxShadow: !_isPressed
              ? [
                  const BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2, 4),
                      blurRadius: 4)
                ]
              : [
                  const BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.4, 1.7),
                      blurRadius: 0.9)
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
            fixedSize: Size(displayWidth * 0.48, 30),
          ),
          onPressed: null,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text(
              widget.buttonText,
              style: TextStyle(
                fontSize: 23,
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

/*
class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;

    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: widget.firstColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.borderRadius)),
        splashFactory: NoSplash.splashFactory,
        foregroundColor: Colors.black,
        fixedSize: Size(displayWidth * 0.48, 48),
        enableFeedback: false,
        elevation: 5
      ),
      onPressed: () {
        widget.onTap();
      },
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
    );
  }

}


 */
/*
class _RoundedButtonState extends State<RoundedButton> {
  bool _isPressed = false;
  bool _nextScreen = false;
  Duration animationDuration = const Duration(milliseconds: 110);

  void buttonPressed() async {
    setState(() {
      _isPressed = !_isPressed;
    });
    _nextScreen = true;
    Future.delayed(const Duration(milliseconds: 700)).then(
      (value) {
        setState(() {
          _isPressed = false;
          _nextScreen = false;
        });
      },
    );
  }

  Future<void> onEnd() async {
    setState(() {
      _isPressed = false;
    });
    await Future.delayed(animationDuration).then(
      (value) {
        if (_nextScreen) {
          widget.onTap();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    // final displayHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      // onTap: buttonPressed,
      onTapDown: (x) => {buttonPressed(), print(x.globalPosition.toString())},
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
 */
