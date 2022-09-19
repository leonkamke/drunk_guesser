import 'package:flutter/material.dart';

class CreditsScreen extends StatelessWidget {
  CreditsScreen({Key? key}) : super(key: key);

  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF536585),
      Color(0xFF304157),
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
                  displayWidth * 0.095,
                  displayHeight * 0.06,
                  displayWidth * 0.095,
                  displayHeight * 0.038),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      "assets/icons/home_icon.png",
                      height: displayHeight * 0.045,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: displayWidth * 0.83,
              child: Card(
                color: const Color(0xFF80A5D7),
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 25),
                  child: Column(
                    children: [
                      Container(
                        width: displayHeight * 0.7,
                        height: displayHeight * 0.25,
                        padding: const EdgeInsets.all(20),
                        child: Image.asset(
                          "assets/images/drunk_guesser_img.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "Kontaktiere uns:",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: displayHeight * 0.02,
                      ),
                      Image.asset(
                        "assets/icons/mail_icon.png",
                        height: displayHeight * 0.045,
                      ),
                      SizedBox(
                        height: displayHeight * 0.02,
                      ),
                      const FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "Development:",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Text(
                        "Luca Burg\nLeon Kamke",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: "Quicksand",
                        ),
                      ),
                      SizedBox(
                        height: displayHeight * 0.1,
                      ),
                      GestureDetector(
                        child: const Text(
                          "Privacy Policy",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 17,
                            color: Colors.white,
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
                            color: Colors.white,
                            fontFamily: "Quicksand",
                          ),
                        ),
                        onTap: () {
                          print("Datenschutzverordnung");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
