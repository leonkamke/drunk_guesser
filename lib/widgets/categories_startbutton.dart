import 'package:drunk_guesser/provider/categories_startbutton_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_colors.dart';

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
  Duration animationDuration = const Duration(milliseconds: 90);

  void buttonPressed() async {
    setState(() {
      _isPressed = !_isPressed;
    });
    await Future.delayed(
            Duration(milliseconds: animationDuration.inMilliseconds * 2))
        .then((value) => widget.onTap());
  }

  void onEnd() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    return AnimatedContainer(
      width: 120,
      height: displayHeight * 0.06,
      curve: Curves.ease,
      duration: animationDuration,
      onEnd: onEnd,
      decoration: BoxDecoration(
        boxShadow: getBoxShadow(context),
        color: context.watch<StartButtonProvider>().disabled
            ? const Color(0xFF446222)
            : widget.firstColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          foregroundColor: const Color(0xFF94BfFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          fixedSize: Size(displayWidth * 0.48, 50),
        ),
        onPressed: context.watch<StartButtonProvider>().disabled
            ? null
            : buttonPressed,
        child: FittedBox(
          child: Text(
            widget.buttonText,
            style: TextStyle(
              fontSize: 20,
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
      return [const BoxShadow(
          color: Color(0x2C000000),
          offset: Offset(1, 3),
          blurRadius: 2)
    ];
    } else {
      if (!_isPressed) {
        return [
          const BoxShadow(
              color: Color(0x96000000), offset: Offset(3, 6), blurRadius: 6)
        ];
      } else {
        return [
          const BoxShadow(
              color: Color(0x96000000), offset: Offset(0.7, 2.1), blurRadius: 1.2)
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
