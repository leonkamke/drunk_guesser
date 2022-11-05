import 'package:drunk_guesser/provider/categories_startbutton_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartButton extends StatefulWidget {
  final String buttonText;
  final Color firstColor;
  final Color secondColor;
  final double borderRadius;
  final Color textColor;
  final void Function() onTap;

  /*
  Good colors:

  Color(0xE0FFA34B),
  Color(0xFFCC700F),

   */

  const StartButton({
    super.key,
    required this.buttonText,
    required this.firstColor,
    required this.secondColor,
    required this.borderRadius,
    required this.textColor,
    required this.onTap,
  });

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
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
      (value) {
        if (_nextScreen) {
          widget.onTap();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTapDown: (x) => {buttonPressed()},
      onTapUp: (x) => {onEnd()},
      onTapCancel: () {
        setState(() {
          _isPressed = false;
          _nextScreen = false;
        });
      },
      child: AnimatedContainer(
        width: 120,
        height: displayHeight * 0.06,
        curve: Curves.ease,
        duration: animationDuration,
        decoration: BoxDecoration(
          boxShadow: !context.watch<StartButtonProvider>().disabled
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
          color: context.watch<StartButtonProvider>().disabled
              ? const Color(0xFF303A44)
              : widget.firstColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            widget.buttonText,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: "Quicksand",
              color: widget.textColor,
            ),
          ),
        ),
      ),
    );
  }

  List<BoxShadow> getBoxShadow(BuildContext context) {
    if (context.watch<StartButtonProvider>().disabled) {
      return [
        const BoxShadow(
            color: Color(0x2C000000), offset: Offset(1, 3), blurRadius: 2)
      ];
    } else {
      if (!_isPressed) {
        return [
          const BoxShadow(
              color: Color(0x96000000), offset: Offset(2, 4), blurRadius: 3)
        ];
      } else {
        return [
          const BoxShadow(
              color: Color(0x96000000),
              offset: Offset(0.2, 1.0),
              blurRadius: 0.5)
        ];
      }
    }
  }
}

/*
class StartButton extends StatelessWidget {
  final void Function() onTap;
  const StartButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextButton(
      style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          fixedSize: const Size(110, 40),
          foregroundColor: const Color(0xFF000000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: AppColors.schriftFarbe_hell,
          disabledBackgroundColor: const Color(0x47000000),
          //shadowColor: Colors.black,
          // elevation: 7
      ),
      onPressed: context.watch<StartButtonProvider>().disabled ? null : onTap,
      child: const FittedBox(
        child: Text(
          "Start",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            fontFamily: "Quicksand",
            color: AppColors.schriftFarbe_startbutton,
          ),
        ),
      ),
    );
  }
}
*/
