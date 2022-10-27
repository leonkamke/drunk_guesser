import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import '../models/app_colors.dart';
import '../models/background_icons.dart';

class GameEndScreen extends StatefulWidget {
  GameEndScreen({Key? key}) : super(key: key);

  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.backgroundHomeScreen_1,
      AppColors.backgroundHomeScreen_2,
    ],
  ));

  @override
  State<GameEndScreen> createState() => _GameEndScreenState();
}

class _GameEndScreenState extends State<GameEndScreen>
    with TickerProviderStateMixin {
  late AnimationController _controllerText;

  bool isEnd = false;

  @override
  void initState() {
    super.initState();

    _controllerText = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        return Future<bool>(() {
          return false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () => endGame(context),
          child: Container(
            width: displayWidth,
            height: displayHeight,
            decoration: widget.backgroundDecoration,
            // alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ...BackgroundIcons.getImages(context),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.fromLTRB(
                        displayWidth * 0.1,
                        displayHeight * 0.05, // ---
                        displayWidth * 0.1,
                        displayHeight * 0.01, // ---
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "SpielEnde",
                              style: TextStyle(
                                fontSize: 30,
                                color: AppColors.appBarText,
                                fontFamily: "Quicksand",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.fromLTRB(0, 0, 0, displayHeight * 0.045),
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: displayWidth * 0.05,
                            vertical: displayWidth * 0.05,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(3, 6),
                                  blurRadius: 6)
                            ],
                            color: AppColors.gameCard,
                          ),
                          width: displayWidth * 0.8,
                          height: displayHeight * 0.5,
                          child: FadeTransition(
                            opacity: _controllerText,
                            child: AutoSizeText(
                              textGameEnd,
                              style: const TextStyle(
                                color: AppColors.schriftFarbe_dunkel,
                                fontFamily: "Quicksand",
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<String> endExercise = [
    "muss 5 Schlücke trinken!",
    "muss 8 Schlücke trinken!",
    "darf 10 Schlücke verteilen!",
  ];

  void endGame(BuildContext context) {
    if (isEnd) {
      Navigator.of(context).pushReplacementNamed("/categories");
    }
    setState(() {
      if (!isEnd) {
        var rand = Random();
        int randomIndex = rand.nextInt(endExercise.length);
        textGameEnd = endExercise[randomIndex];
        isEnd = true;
      }
    });
  }

  String textGameEnd =
      "Zählt von 3 runter und zeigt alle gleichzeitig auf die Person die am schlechtesten gespielt hat.\n\nDiese Person ... (Auflösung folgt)";
}
