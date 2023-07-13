import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:drunk_guesser/models/app_colors.dart';
import 'package:drunk_guesser/models/background_icons.dart';
import 'package:flutter/material.dart';

class RulesScreen extends StatefulWidget {
  RulesScreen({Key? key}) : super(key: key);

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.background_1,
      AppColors.background_2,
    ],
  ));

  int pageindex = 0;

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
                    displayHeight * 0.06,
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
                          "Anleitung",
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
                  child: CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1.0,
                        height: double.infinity,
                        // autoPlay: false,
                        onPageChanged: (index, _) {
                          setState(() {
                            pageindex = index;
                            // print(pageindex);
                          });
                        }),
                    items: [
                      oneSlider("Spielstart", spielStartText),
                      oneSlider(
                          "Spielablauf", spielAblaufText),
                    ],
                  ),
                ),
                Container(
                  height: displayHeight * 0.06,
                  width: displayWidth,
                  /*
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0, -3),
                          blurRadius: 6)
                    ],
                    color: AppColors.appbarBackground,
                  ),*/
                  child: DotsIndicator(
                    dotsCount: 2,
                    position: pageindex,
                    decorator: const DotsDecorator(
                      activeSize: Size(12, 12),
                      size: Size(8, 8),
                      color: AppColors.dotColor_Inactive, // Inactive color
                      activeColor: AppColors.dotColor_Active,
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

  Widget oneSlider(String ueberschrift, String text) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    return Container(
      width: displayWidth,
      padding:
          EdgeInsets.fromLTRB(displayWidth * 0.1, 0, displayWidth * 0.05, 0),
      child: RawScrollbar(
        thumbColor: const Color(0x52292f38),
        radius: const Radius.circular(20),
        thickness: 5,
        child: ListView(
          padding: EdgeInsets.fromLTRB(
              0, displayHeight * 0.05, 0, displayHeight * 0.05),
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              ueberschrift,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 26,
                color: AppColors.schriftFarbeCards,
                fontFamily: "Quicksand",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: displayHeight * 0.03),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.schriftFarbeCards,
                fontFamily: "Quicksand",
              ),
            ),
          ],
        ),
      ),
    );
  }

  final String spielStartText =
      "Das Spiel kann mit beliebig vielen Spielern gespielt werden.\n\nUm ein Spiel zu starten, werden eine oder mehrere Kategorien ausgewählt, mit denen gespielt werden soll.\n\nDanach wird auf \"Start\" geklickt, um das Spiel zu starten.\n\nDie Kategorie \"Zufall\" kann auch mit anderen Kategorien verknüpft werden.";

  final String spielAblaufText =
      "Wählt einen Fragesteller. Dieser Spieler ließt die Fragen vor.\n\nNachdem das Spiel gestartet wurde, erscheint eine Frage auf dem Bildschirm, die vorgelesen wird.\n\nDann schreibt jeder Spieler seine Schätzung auf.\n\nWenn alle fertig sind, wird durch ein Klicken auf die Fragekarte die Antwort angezeigt.\n\nDerjenige, der am schlechtesten geschätzt hat, muss trinken!\n\nEntscheidet vor dem Spiel selbst, wie viele Schlücke getrunken werden müssen.\n\n(Selbstverständlich sind auch null Schlücke möglich)\n\nDurch ein weiteres Klicken auf die Karte wird die nächste Frage angezeigt und der Ablauf beginnt von vorne.\n\nEin Spiel besteht aus 18 zufälligen Fragen, der ausgewählten Kategorien und endet mit der Frage, welcher Spieler am schlechteste gespielt hat.\n\nAlles klar? Dann viel Spaß beim Schätzen!";

}
