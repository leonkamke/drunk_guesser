import 'package:flutter/material.dart';

import '../database/drunk_guesser_db.dart';
import '../widgets/rounded_button.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF80A5D7),
          Color(0xFF6B9EE3),
        ],
      ));

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: displayWidth,
        height: displayHeight,
        decoration: backgroundDecoration,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0, 3),
                      blurRadius: 6)
                ],
                color: Color(0xFF292F38),
              ),
              padding: EdgeInsets.fromLTRB(
                displayWidth * 0.1,
                displayHeight * 0.05,
                displayWidth * 0.1,
                displayHeight * 0.025,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "Einstellungen",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xffffffff),
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.home_rounded,
                      size: 45,
                      color: Color(0xffffffff),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(
                    buttonText: "Bewerten",
                    borderRadius: 15,
                    firstColor: const Color(0xFF292F38),
                    secondColor: const Color(0xFF292F38),
                    onTap: () async {
                      print("leave a comment for the app");
                      await DrunkGuesserDB.getLocalVersion();
                    },
                  ),
                  SizedBox(
                    height: displayHeight * 0.04,
                  ),
                  RoundedButton(
                    buttonText: "Teilen",
                    borderRadius: 15,
                    firstColor: const Color(0xFF292F38),
                    secondColor: const Color(0xFF292F38),
                    onTap: () {
                      print("Share app");
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              height: 150,
              child: Image.asset(
                "assets/images/drunk_guesser_img.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: displayHeight * 0.05,)
          ],
        ),
      ),
    );
  }
}
