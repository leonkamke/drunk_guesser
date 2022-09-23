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
                  displayWidth * 0.1,
                  displayHeight * 0.06,
                  displayWidth * 0.1,
                  displayHeight * 0.035,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        "Spielregeln",
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF292F38),
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "assets/icons/home_icon_dark.png",
                        height: 30,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: displayWidth,
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Spielstart",
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
                    Container(
                      width: displayWidth * 0.9,
                      height: displayHeight * 0.8,
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            spielAblaufText_1,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xFF292F38),
                              fontFamily: "Quicksand",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: displayWidth * 0.9,
                      height: displayHeight * 0.8,
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            spielAblaufText_2,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xFF292F38),
                              fontFamily: "Quicksand",
                            ),
                          ),
                        ],
                      ),
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
            ],
          ),
        ));
  }

  final String spielStartText =
      "Um ein Spiel zu starten, wählt ihr zu Beginn die Kategorien aus mit denen ihr spielen wollt (manche kostenpflichtig).\n\nDanach klickt ihr Start um das Spiel zu starten.";

  final String spielAblaufText_1 =
      "Das Spiel kann mit beliebig vielen Leuten gespielt werden.\n\nEs werden nacheinander die Fragen auf dem Bildschirm angezeigt, die der Fragensteller vorließt.\n\nJeder Spieler schreibt seine Antwort auf (zum Beispiel in eine Notiz-App).";

  final String spielAblaufText_2 =
      "Durch ein Klicken auf den Bildschirm, wird die Lösung angezeigt.\n\nDerjenige, der am schlechtesten geschätzt hat, trinkt!\n\nDurch ein weiters Klicken wird die nächste Frage angezeigt usw.\n\nDas Spiel endet mit der Frage, welcher Spieler am schlechteste gespielt hat.";
}
