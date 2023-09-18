import 'package:drunk_guesser/api/purchase_api.dart';
import 'package:drunk_guesser/models/background_icons.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

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
    // Get the padding of the safe area
    EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;

    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height - safeAreaPadding.top - safeAreaPadding.bottom;

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
                  /*
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
                  ),*/
                  padding: EdgeInsets.fromLTRB(
                    displayWidth * 0.075,
                    displayHeight * 0.02,
                    displayWidth * 0.075,
                    displayHeight * 0.02,
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
                          size: 40,
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
                      FilledButton(
                          onPressed: () async {
                            print("leave a comment for the app");
                            print(await DrunkGuesserDB.getLocalVersion());
                          },
                          style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(4.3),
                              fixedSize:
                              MaterialStatePropertyAll(Size(180, 50)),
                              backgroundColor:
                              MaterialStatePropertyAll<Color>(
                                  AppColors.settingsButtonBackground),
                              side: MaterialStatePropertyAll<BorderSide>(
                                  BorderSide(width: 2.4, color: Colors.black))),
                          child: const Text(
                            "Bewerten",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand",
                              color: AppColors.drunkguesserSchrift,
                            ),
                          )),
                      SizedBox(
                        height: displayHeight * 0.04,
                      ),
                      FilledButton(
                          onPressed: () {
                            print("Share app");
                            print("Delete local database");
                            DrunkGuesserDB.deleteDB();
                          },
                          style: const ButtonStyle(
                              elevation: MaterialStatePropertyAll(4.3),
                              fixedSize:
                              MaterialStatePropertyAll(Size(180, 50)),
                              backgroundColor:
                              MaterialStatePropertyAll<Color>(
                                  AppColors.settingsButtonBackground),
                              side: MaterialStatePropertyAll<BorderSide>(
                                  BorderSide(width: 2.4, color: Colors.black))),
                          child: const Text(
                            "Teilen",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Quicksand",
                              color: AppColors.drunkguesserSchrift,
                            ),
                          )),
                      SizedBox(
                        height: displayHeight * 0.04,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 150,
                  height: 150,
                  child: rive.RiveAnimation.asset(
                    'assets/animations/drunkguesser2.2.riv',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  child: const Text(
                    "Käufe wiederherstellen",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 17,
                      color: AppColors.schriftFarbeCards,
                      fontFamily: "Quicksand",
                    ),
                  ),
                  onTap: () async {
                    print("Restore products");
                    await PurchaseApi.restoreProducts();
                  },
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
