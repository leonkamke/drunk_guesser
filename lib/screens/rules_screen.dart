import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
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
      Color(0xFF80A5D7),
      Color(0xFF6B9EE3),
    ],
  ));

  double pageindex = 0.0;

  void _updatePosition(double position) {
    setState(() => pageindex = position);
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
                      "Anleitung",
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
              child: CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1.0,
                    height: double.infinity,
                    // autoPlay: false,
                    onPageChanged: (index, _) {
                      setState(() {
                        pageindex = index.toDouble();
                        print(pageindex);
                      });
                    }),
                items: [
                  Container(
                    width: displayWidth,
                    padding: EdgeInsets.fromLTRB(
                        displayWidth * 0.1, 0, displayWidth * 0.05, 0),
                    child: RawScrollbar(
                      thumbColor: const Color(0x52292f38),
                      radius: const Radius.circular(20),
                      thickness: 5,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          const Text(
                            "Spielstart",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 25,
                              color: Color(0xff292f38),
                              fontFamily: "Quicksand",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: displayHeight * 0.03),
                          Text(
                            spielStartText,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xFF292F38),
                              fontFamily: "Quicksand",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: displayWidth,
                    padding: EdgeInsets.fromLTRB(
                        displayWidth * 0.1, 0, displayWidth * 0.05, 0),
                    child: RawScrollbar(
                      thumbColor: Color(0x52292f38),
                      radius: const Radius.circular(20),
                      thickness: 5,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          const Text(
                            "Spielablauf",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 25,
                              color: Color(0xFF292F38),
                              fontFamily: "Quicksand",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: displayHeight * 0.03),
                          Text(
                            spielAblaufText_1 + spielAblaufText_2,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xFF292F38),
                              fontFamily: "Quicksand",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DotsIndicator(
              dotsCount: 2,
              position: pageindex,
              decorator: const DotsDecorator(
                activeSize: Size(12, 12),
                size: Size(8, 8),
                color: Color(0x52292f38), // Inactive color
                activeColor: Color(0xff292f38),
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
          ],
        ),
      ),
    );
  }

  final String spielStartText =
      "Um ein Spiel zu starten, wählt ihr zu Beginn die Kategorien aus mit denen ihr spielen wollt (manche kostenpflichtig).\n\nDanach klickt ihr Start um das Spiel zu starten.";

  final String spielAblaufText_1 =
      "Das Spiel kann mit beliebig vielen Leuten gespielt werden.\n\nEs werden nacheinander die Fragen auf dem Bildschirm angezeigt, die der Fragensteller vorließt.\n\nJeder Spieler schreibt seine Antwort auf (zum Beispiel in eine Notiz-App).";

  final String spielAblaufText_2 =
      "Durch ein Klicken auf den Bildschirm, wird die Lösung angezeigt.\n\nDerjenige, der am schlechtesten geschätzt hat, trinkt!\n\nDurch ein weiters Klicken wird die nächste Frage angezeigt usw.\n\nDas Spiel endet mit der Frage, welcher Spieler am schlechteste gespielt hat.\n\n Viel Spaß beim Spielen!";

  final Map<String, String> items = {
    "Spielstart":
        "Um ein Spiel zu starten, wählt ihr zu Beginn die Kategorien aus mit denen ihr spielen wollt (manche kostenpflichtig).\n\nDanach klickt ihr Start um das Spiel zu starten.",
    "Spielablauf":
        "Das Spiel kann mit beliebig vielen Leuten gespielt werden.\n\nEs werden nacheinander die Fragen auf dem Bildschirm angezeigt, die der Fragensteller vorließt.\n\nJeder Spieler schreibt seine Antwort auf (zum Beispiel in eine Notiz-App). Durch ein Klicken auf den Bildschirm, wird die Lösung angezeigt.\n\nDerjenige, der am schlechtesten geschätzt hat, trinkt!\n\nDurch ein weiters Klicken wird die nächste Frage angezeigt usw.\n\nDas Spiel endet mit der Frage, welcher Spieler am schlechteste gespielt hat.\n\n Viel Spaß beim Spielen!"
  };

  final List<String> items_ueberschrift = ["Spielstart", "Spielablauf"];
}
