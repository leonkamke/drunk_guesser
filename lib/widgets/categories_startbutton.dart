import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final void Function() onTap;
  const StartButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          fixedSize: const Size(110, 40),
          foregroundColor: const Color(0xFF94BfFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Color(0xff444e5a),
          shadowColor: Colors.black,
          elevation: 7
        ),
        onPressed: onTap,
        child: const FittedBox(
          child: Text(
            "Start",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              fontFamily: "Quicksand",
              color: Color(0xFFF6F6F6),
            ),
          ),
        ),
    );
  }
}
