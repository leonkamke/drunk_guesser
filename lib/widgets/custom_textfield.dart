import 'package:flutter/material.dart';

import '../models/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final Color baseColor;
  final Color borderColor;

  CustomTextField({
    required this.baseColor,
    required this.borderColor,
  });

  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  /*
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.gameCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: Border.all(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: widget.baseColor,
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w300,
            ),
            border: InputBorder.none,
            hintText: widget.hint,
          ),
        ),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gameCard,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(40),
        //border: Border.all(color: Colors.white70, width: 3)
      ),
      child:const  Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "Quicksand"),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Color(0x5FFFFFFF),
              fontSize: 18,
              fontFamily: "Quicksand",
            ),
            border: InputBorder.none,
            hintText: "Deine Antwort",
          ),
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
