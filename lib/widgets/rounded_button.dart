import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String buttonText;

  const RoundedButton({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black54, offset: Offset(0, 5), blurRadius: 7)
          ],
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xE0FFA34B),
              Color(0xFFCC700F),
            ],
          ),
          //color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              //side: const BorderSide(width: 4, color: Color(0x774B3333)),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            fixedSize: Size(displayWidth / 2, displayHeight / 14),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: "Quicksand",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
