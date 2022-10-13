import 'package:drunk_guesser/models/background_icons.dart';
import 'package:flutter/material.dart';

import '../models/app_colors.dart';
import '../database/drunk_guesser_db.dart';
import '../widgets/rounded_button.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.background_1,
      AppColors.background_2,
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
        child: Stack(
          children: [
            ...BackgroundIcons.getImages(context),
            Column(
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
                    color: AppColors.appbarBackground,
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
                            color: AppColors.appBarText,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.home_rounded,
                          size: 45,
                          color: AppColors.appBarText,
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
                        firstColor: AppColors.appbarBackground,
                        secondColor: AppColors.appbarBackground,
                        textColor: AppColors.appBarText,
                        onTap: () async {
                          print("leave a comment for the app");
                          print(await DrunkGuesserDB.getLocalVersion());
                        },
                      ),
                      SizedBox(
                        height: displayHeight * 0.04,
                      ),
                      RoundedButton(
                        buttonText: "Teilen",
                        borderRadius: 15,
                        firstColor: AppColors.appbarBackground,
                        secondColor: AppColors.appbarBackground,
                        textColor: AppColors.appBarText,
                        onTap: () {
                          print("Share app");
                          print("Delete local database");
                          DrunkGuesserDB.deleteDB();
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
                SizedBox(
                  height: displayHeight * 0.05,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
