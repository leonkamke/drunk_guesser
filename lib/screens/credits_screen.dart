import 'package:drunk_guesser/models/app_colors.dart';
import 'package:drunk_guesser/models/background_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rive/rive.dart' as rive;


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
                      Container(
                        margin:
                            EdgeInsets.fromLTRB(0, displayHeight * 0.04, 0, 0),
                        width: 120,
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
                          color: Colors.white,
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
                      SizedBox(
                        height: displayHeight * 0.1,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    "Privacy Policy",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 17,
                      color: AppColors.schriftFarbeCards,
                      fontFamily: "Quicksand",
                    ),
                  ),
                  onTap: () {
                    print("Privacy Policy");
                  },
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
                    print("Datenschutzverordnung");
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
    const String _emailScheme = "mailto:l.kamke@web.de";
    final Uri _url = Uri.parse(_emailScheme);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
