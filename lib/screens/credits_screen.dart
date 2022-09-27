import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      "Credits",
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, displayHeight*0.04, 0, 0),
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      "assets/images/drunk_guesser_img.png",
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
                        color: Color(0xFF292F38),
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayHeight * 0.02,
                  ),
                  GestureDetector(
                    child: Image.asset(
                      "assets/icons/mail_icon_dark.png",
                      height: 30,
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
                        color: Color(0xFF292F38),
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
                      color: Color(0xFF292F38),
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
                  color: Color(0xFF292F38),
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
                  color: Color(0xFF292F38),
                  fontFamily: "Quicksand",
                ),
              ),
              onTap: () {
                print("Datenschutzverordnung");
              },
            ),
            SizedBox(height: displayHeight * 0.05),
            Container(
              height: 40,
              width: displayWidth,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0, -3),
                      blurRadius: 6)
                ],
                color: Color(0xFF292F38),
              ),
              child: Row(
                children: [
                  Container(
                    child: Text("   @DrunkGuesser", style: TextStyle(color: Color(0xffffffff), fontSize: 9,fontFamily: "Quicksand",),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendEmail() async {
    const String _emailScheme =
        "mailto:l.kamke@web.de";
    final Uri _url = Uri.parse(_emailScheme);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
