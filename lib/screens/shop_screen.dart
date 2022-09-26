import 'package:flutter/material.dart';

import '../widgets/rounded_button.dart';
import '../widgets/shop_button.dart';

class ShopScreen extends StatefulWidget {
  ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFFFF6C6),
    ],
  ));

  String buttonText = "Kaufen";

  /*
  Stores which button is selected
  (0 == "Einzelne Kategorien", 1 == "Vollversion", 2 == "Bundles")
   */
  int selectedButton = 1;

  String text = "Kaufe dir die Vollversion (alle Kategorien) für 4,99€";

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
                0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "Shop",
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
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShopButton(
                      radiusBL: 0,
                      radiusBR: 0,
                      radiusTL: 20,
                      radiusTR: 20,
                      buttonText: "Einzelne Kategorien",
                      selected: selectedButton == 0,
                      onTap: () {
                        setState(
                          () {
                            selectedButton = 0;
                            buttonText = "Weiter";
                            text =
                                "Kaufe dir eine einzelne Kategorie für 0,69€ + keine Werbung";
                          },
                        );
                      }),
                  SizedBox(
                    height: 5,
                  ),
                  ShopButton(
                      radiusBL: 0,
                      radiusBR: 0,
                      radiusTL: 0,
                      radiusTR: 0,
                      buttonText: "Vollversion",
                      selected: selectedButton == 1,
                      onTap: () {
                        setState(
                          () {
                            selectedButton = 1;
                            buttonText = "Kaufen";
                            text =
                                "Kaufe dir die Vollversion (alle Kategorien) für 4,99€ + keine Werbung";
                          },
                        );
                      }),
                  SizedBox(
                    height: 5,
                  ),
                  ShopButton(
                      radiusBL: 20,
                      radiusBR: 20,
                      radiusTL: 0,
                      radiusTR: 0,
                      buttonText: "Bundles",
                      selected: selectedButton == 2,
                      onTap: () {
                        setState(
                          () {
                            selectedButton = 2;
                            buttonText = "Weiter";
                            text = "Wähle das Bundle mit den Kategorien die dir am besten gefallen + keine Werbung";
                          },
                        );
                      }),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: displayWidth * 0.8,
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(3, 6),
                      blurRadius: 6)
                ],
                color: Color(0xFF444E5A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                  foregroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Color(0xFF444E5A),
                  shadowColor: Colors.transparent,
                  fixedSize: const Size(270, 70),
                ),
                onPressed: () => print("buy"),
                child: FittedBox(
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Quicksand",
                      color: Color(0xfffff8b9),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: displayHeight * 0.07,
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
            SizedBox(height: displayHeight * 0.03),
          ],
        ),
      ),
    );
  }

  void buy() {
    print("Buy");
  }
}
