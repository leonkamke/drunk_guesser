import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_colors.dart';
import '../provider/textfield_provider.dart';

class CustomTextField extends StatelessWidget {
  final Color baseColor;
  final Color borderColor;
  final TextEditingController controller = TextEditingController();

  CustomTextField({
    required this.baseColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gameCard,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(40),
        //border: Border.all(color: Colors.white70, width: 3)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: controller,
          enabled: context.watch<TextFieldProvider>().enabled,
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Quicksand"),
          decoration: const InputDecoration(
            hintStyle: TextStyle(
              color: Color(0x5FFFFFFF),
              fontSize: 18,
              fontFamily: "Quicksand",
            ),
            border: InputBorder.none,
            hintText: "Deine Antwort",
          ),
          autofocus: false,
          cursorHeight: 18,
          cursorColor: Color(0xFFFFFFFF),
          showCursor: true,
          cursorRadius: Radius.circular(15),
          cursorWidth: 1.5,
        ),
      ),
    );
  }
}