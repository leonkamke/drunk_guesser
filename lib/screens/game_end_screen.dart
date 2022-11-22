import 'package:auto_size_text/auto_size_text.dart';
import 'package:drunk_guesser/models/admob_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:math';
import 'dart:io' show Platform;
import 'package:rive/rive.dart' as rive;

import '../models/app_colors.dart';
import '../models/background_icons.dart';
import '../models/entitlements.dart';

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
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
    // _createInterstitialAd();
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
          onTap: () async => await endGame(context),
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
                      height: 90,
                      color: Colors.transparent,
                      padding: EdgeInsets.fromLTRB(
                        displayWidth * 0.06,
                        displayHeight * 0.05,
                        displayWidth * 0.06,
                        displayHeight * 0.01,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Spielende",
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
                        //color: Colors.black38,
                        alignment: Alignment.center,
                        child: Container(
                          // color: Colors.black45,
                          height: displayHeight * 0.6,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Positioned(
                                top: 0,
                                child: SizedBox(
                                  width: displayHeight * 0.18,
                                  height: displayHeight * 0.18,
                                  child: const rive.RiveAnimation.asset(
                                    'assets/animations/drunkguesser2.2.riv',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Container(
                                width: displayWidth * 0.8,
                                height: displayHeight * 0.5,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                  horizontal: displayWidth * 0.05,
                                  vertical: displayWidth * 0.05,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: AppColors.gameCard,
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: AutoSizeText(
                                          textGameEnd,
                                          style: const TextStyle(
                                            color:
                                                AppColors.schriftFarbe_dunkel,
                                            fontFamily: "Quicksand",
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: displayHeight * 0.088,
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

  Future<void> endGame(BuildContext context) async {
    if (isEnd) {
      if (Entitlements.showAds) {
        Navigator.of(context).pushReplacementNamed("/categories");
        AdMobProvider.showInterstitialAd();
      } else {
        Navigator.of(context).pushReplacementNamed("/categories");
      }
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
      "Zählt von drei runter und zeigt alle gleichzeitig auf die Person, die am schlechtesten gespielt hat.\n\nDiese Person...\n(Auflösung folgt)";
}
