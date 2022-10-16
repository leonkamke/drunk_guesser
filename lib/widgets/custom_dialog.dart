import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/app_colors.dart';

class CustomDialogBox extends StatefulWidget {
  final String description;

  CustomDialogBox({Key? key, required this.description}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54, offset: Offset(3, 6), blurRadius: 6)
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 17),
                child: AutoSizeText(
                  widget.description,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0x8C000000)),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black45)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          right: BorderSide(color: Colors.black45),
                        )),
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const AutoSizeText(
                            "Ja",
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColors.backgroundHomeScreen_1,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const AutoSizeText(
                            "Nein",
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColors.backgroundHomeScreen_1,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

/*

 onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).pushReplacementNamed("/home");
                          },




                      onPressed: () {
                            Navigator.of(context).pop();
                          }
   */
}
