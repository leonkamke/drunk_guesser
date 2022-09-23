import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String buttonText;
  final Color firstColor;
  final Color secondColor;
  final double borderRadius;
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
    required this.borderRadius,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.black54, offset: Offset(3, 6), blurRadius: 6)
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            firstColor,
            secondColor,
          ],
        ),
        //color: Colors.deepPurple.shade300,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          foregroundColor: const Color(0xFF94BFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            //side: const BorderSide(width: 4, color: Color(0x774B3333)),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          fixedSize: Size(200, 20),
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.only(

          ),
          child: FittedBox(
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                fontFamily: "Quicksand",
                color: Color(0xFFF6F6F6),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
