import 'package:drunk_guesser/database/drunk_guesser_db.dart';
import 'package:drunk_guesser/models/app_colors.dart';
import 'package:drunk_guesser/models/entitlements.dart';
import 'package:drunk_guesser/widgets/rounded_button.dart';
import 'package:drunk_guesser/widgets/icon_button.dart' as customIconButton;
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rive/rive.dart' as rive;

import '../models/category.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    try {
      await DrunkGuesserDB.initDatabase();
      await DrunkGuesserDB.updateDatabase();
      for (Category category in Entitlements.categoryList) {
        category.setPurchased();
      }
      // Check wether to show ads
      Entitlements.setShowAds();
    } catch (e) {
      print(e);
    }
    await Future.delayed(const Duration(milliseconds: 500));
    FlutterNativeSplash.remove();
  }

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
        child: Stack(
          children: [
            ...getImages(context),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(
                    displayWidth * 0.066,
                    displayHeight * 0.06,
                    displayWidth * 0.066,
                    0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      customIconButton.IconButton(
                        text: "Anleitung",
                        textColor: AppColors.homescreen_icons,
                        icon: const Icon(
                          Icons.description_rounded,
                          size: 32,
                          color: AppColors.homescreen_icons,
                        ),
                        onTap: () {
                          print(displayHeight);
                          Navigator.of(context).pushNamed("/rules");
                        },
                      ),
                      customIconButton.IconButton(
                        text: "Credits",
                        textColor: AppColors.homescreen_icons,
                        icon: const Icon(
                          Icons.info_rounded,
                          size: 32,
                          color: AppColors.homescreen_icons,
                        ),
                        onTap: () {
                          print(displayWidth);
                          // Navigate to CreditsScreen
                          Navigator.pushNamed(context, "/credits");
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: displayHeight * 0.07,
                ),
                const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "DrunkGuesser",
                    style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Quicksand",
                        color: AppColors.drunkguesserSchrift,
                        shadows: [
                          Shadow(
                            offset: Offset(1.15, 1.5),
                            blurRadius: 9,
                            color: Colors.black54,
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, displayHeight * 0.03, 0, 0),
                    margin: EdgeInsets.fromLTRB(
                        0, displayHeight * 0.04, 0, displayHeight * 0.04),
                    alignment: Alignment.center,
                    width: displayWidth * 0.45,
                    height: displayWidth * 0.45,
                    child: const rive.RiveAnimation.asset(
                      'assets/animations/drunkguesser2.2.riv',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, displayHeight * 0.09),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RoundedButton(
                          buttonText: "Start",
                          borderRadius: 20,
                          firstColor: AppColors.startButtonBackground,
                          secondColor: AppColors.startButtonBackground,
                          textColor: AppColors.startButtonText,
                          onClickColor: const Color(0xFF000000),
                          onTap: () {
                            Navigator.of(context).pushNamed("/categories");
                          },
                        ),
                        SizedBox(
                          height: displayHeight * 0.03,
                        ),
                        RoundedButton(
                          buttonText: "Einstellungen",
                          borderRadius: 20,
                          firstColor: AppColors.settingsButtonBackground,
                          secondColor: AppColors.settingsButtonBackground,
                          textColor: AppColors.settingsButtonText,
                          onClickColor: const Color(0xFF000000),
                          onTap: () {
                            Navigator.of(context).pushNamed("/settings");
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> getImages(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    double iconHeight = displayWidth * 0.182;
    Color iconColor = Color(0xB000000);
    return [
      Positioned(
        top: displayHeight * 0.05,
        left: displayWidth * 0.1,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        top: displayHeight * 0.09,
        left: displayWidth * 0.5,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        top: displayHeight * 0.28,
        left: displayWidth * 0.04,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        top: displayHeight * 0.32,
        left: displayWidth * 0.8,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),

      // ----------------

      Positioned(
        bottom: displayHeight * 0.05,
        right: displayWidth * 0.1,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        bottom: displayHeight * 0.09,
        right: displayWidth * 0.5,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        bottom: displayHeight * 0.28,
        right: displayWidth * 0.04,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        bottom: displayHeight * 0.32,
        right: displayWidth * 0.8,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        bottom: displayHeight * 0.02,
        right: displayWidth * 0.8,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
    ];
  }
}
