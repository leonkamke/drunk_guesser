import 'package:drunk_guesser/database/drunk_guesser_db.dart';
import 'package:drunk_guesser/models/app_colors.dart';
import 'package:drunk_guesser/models/category_data.dart';
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
  /*

  Good colors for background:

      Color(0xFFFF5858),
      Color(0xFFB64A4A),

      Color(0xFFFF5858),
      Color(0xFFF87A54),

      Color(0xFF3E5ED9),
      Color(0xFF6EA6F1),

      wie bier:
      Color(0xFFEAA84A),
      Color(0xFFCC700F),

      good light blue: Color(0xFF63A4E1)

   */
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
    for (Category category in Categories.categoryList) {
      category.setPurchased();
    }
    await Future.delayed(const Duration(milliseconds: 1400));
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
        child: Column(
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
                    icon: const Icon(
                      Icons.description_rounded,
                      size: 35,
                      color: AppColors.buttonHomeScreenBackground,
                    ),
                    onTap: () {
                      print(displayHeight);
                      Navigator.of(context).pushNamed("/rules");
                    },
                  ),
                  customIconButton.IconButton(
                    text: "Credits",
                    icon: const Icon(
                      Icons.info_rounded,
                      size: 35,
                      color: AppColors.buttonHomeScreenBackground,
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
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Quicksand",
                    color: AppColors.drunkguesserSchrift,
                    shadows: [
                      Shadow(
                        offset: Offset(2.2, 3.2),
                        blurRadius: 9,
                        color: Colors.black54,
                      ),
                    ]),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    child: const rive.RiveAnimation.asset(
                      'assets/animations/drunkguesser2.2.riv',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, displayHeight * 0.09),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                      buttonText: "Start",
                      borderRadius: 15,
                      firstColor: AppColors.buttonHomeScreenBackground,
                      secondColor: AppColors.buttonHomeScreenBackground,
                      onTap: () {
                        Navigator.of(context).pushNamed("/categories");
                      },
                    ),
                    SizedBox(
                      height: displayHeight * 0.03,
                    ),
                    RoundedButton(
                      buttonText: "Einstellungen",
                      borderRadius: 15,
                      firstColor: AppColors.buttonHomeScreenBackground,
                      secondColor: AppColors.buttonHomeScreenBackground,
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
      ),
    );
  }
}
