import 'package:flutter/material.dart';

import '../widgets/rounded_button.dart';
import '../widgets/shop_button.dart';

class ShopMainScreen extends StatefulWidget {
  ShopMainScreen({Key? key}) : super(key: key);

  @override
  State<ShopMainScreen> createState() => _ShopMainScreenState();
}

class _ShopMainScreenState extends State<ShopMainScreen> {
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
        child: Stack(
          children: [
            ...getImages(context),
            Column(
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
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                        child: const Icon(
                          Icons.close_rounded,
                          size: 36,
                          color: Color(0xff292f38),
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
                                text =
                                    "Wähle das Bundle mit den Kategorien die dir am besten gefallen + keine Werbung";
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
                    border: Border.all(color: Color(0xfffff8b9), width: 3.5),
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
                    onPressed: () => buy(context),
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
          ],
        ),
      ),
    );
  }

  void buy(BuildContext context) {
    if (selectedButton == 0) {        // Einzelne Kategorien
      print("buy single category");
      Navigator.of(context).pushReplacementNamed("/shop_category");
    } else if (selectedButton == 1) { // Vollversion
      print("buy fullversion");
      // TODO: Use RevenueCat for the transaction
    } else {                          // Bundles
      print("buy bundle");
      Navigator.of(context).pushReplacementNamed("/shop_bundles");
    }
  }

  List<Widget> getImages(BuildContext context) {
    const double iconHeight = 45;
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    return [
      Positioned(
        top: displayHeight * 0.15,
        left: displayWidth * 0.7,
        child: Image.asset(
          "assets/categories_icons/nature_icon.png",
          height: iconHeight,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        top: displayHeight * 0.3,
        left: displayWidth * 0.08,
        child: Image.asset(
          "assets/categories_icons/media_icon.png",
          height: iconHeight,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        top: displayHeight * 0.135,
        left: displayWidth * 0.39,
        child: Image.asset(
          "assets/categories_icons/tech_icon.png",
          height: iconHeight,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        top: displayHeight * 0.19,
        left: displayWidth * 0.09,
        child: Image.asset(
          "assets/categories_icons/price_icon.png",
          height: iconHeight * 0.7,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        top: displayHeight * 0.5,
        left: displayWidth * 0.094,
        child: Image.asset(
          "assets/images/drunk_guesser_img.png",
          height: iconHeight,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        top: displayHeight * 0.53,
        left: displayWidth * 0.38,
        child: Image.asset(
          "assets/categories_icons/18plus_icon.png",
          height: iconHeight,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        top: displayHeight * 0.5,
        left: displayWidth * 0.73,
        child: Image.asset(
          "assets/categories_icons/music_icon.png",
          height: iconHeight,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        top: displayHeight * 0.3,
        left: displayWidth * 0.85,
        child: Image.asset(
          "assets/categories_icons/history_icon.png",
          height: iconHeight,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        top: displayHeight * 0.355,
        left: displayWidth * 0.65,
        child: Image.asset(
          "assets/categories_icons/google_icon.png",
          height: iconHeight,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        top: displayHeight * 0.27,
        left: displayWidth * 0.5,
        child: Image.asset(
          "assets/categories_icons/geography_icon.png",
          height: iconHeight * 0.88,
          fit: BoxFit.contain,
        ),
      ),
      Positioned(
        top: displayHeight * 0.37,
        left: displayWidth * 0.2,
        child: Image.asset(
          "assets/categories_icons/sports_icon.png",
          height: iconHeight * 0.8,
          fit: BoxFit.contain,
        ),
      ),
    ];
  }
}
