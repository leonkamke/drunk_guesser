import 'package:drunk_guesser/models/app_colors.dart';
import 'package:drunk_guesser/models/background_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rive/rive.dart' as rive;

// import '../widgets/policy_dialog.dart';

class CreditsScreen extends StatefulWidget {
  CreditsScreen({Key? key}) : super(key: key);

  @override
  State<CreditsScreen> createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen> {
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
                  padding: EdgeInsets.fromLTRB(
                    displayWidth * 0.075,
                    displayHeight * 0.06,
                    displayWidth * 0.075,
                    displayHeight * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Credits",
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
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0, displayHeight * 0.02, 0, 0),
                        width: displayHeight * 0.2,
                        height: 120,
                        child: const rive.RiveAnimation.asset(
                          'assets/animations/drunkguesser2.2.riv',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: displayHeight * 0.05,
                      ),
                      const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "Kontaktiere uns:",
                          style: TextStyle(
                            fontSize: 23,
                            color: AppColors.schriftFarbeCards,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: displayHeight * 0.02,
                      ),
                      GestureDetector(
                        child: const Icon(
                          Icons.mail_outline_rounded,
                          size: 43,
                          color: AppColors.schriftFarbeCards,
                        ),
                        onTap: () {
                          sendEmail();
                        },
                      ),
                      SizedBox(
                        height: displayHeight * 0.03,
                      ),
                      const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "Development:",
                          style: TextStyle(
                            fontSize: 23,
                            color: AppColors.schriftFarbeCards,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: displayHeight * 0.02,
                      ),
                      const Text(
                        "Luca Burg\nLeon Kamke",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19,
                          color: AppColors.schriftFarbeCards,
                          fontFamily: "Quicksand",
                        ),
                      ),

                    ],
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    "Datenschutzverordnung",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 17,
                      color: AppColors.schriftFarbeCards,
                      fontFamily: "Quicksand",
                    ),
                  ),
                  onTap: () {
                    openPrivacyPolicy();
                  },
                ),
                SizedBox(height: displayHeight * 0.05),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendEmail() async {
    const String emailScheme = "mailto:noodle.apps.22@gmail.com";
    final Uri url = Uri.parse(emailScheme);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> openPrivacyPolicy() async {
    const String urlScheme = "https:www.google.de";
    final Uri url = Uri.parse(urlScheme);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
