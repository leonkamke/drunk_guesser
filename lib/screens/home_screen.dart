import 'package:drunk_guesser/widgets/rounded_button.dart';
import 'package:drunk_guesser/widgets/icon_button.dart' as CustomIconButton;
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as Rive;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  /*

  Good colors for background:

      Color(0xFFFF5858),
      Color(0xFFB64A4A),

      Color(0xFFFF5858),
      Color(0xFFF87A54),

      Color(0xFF3E5ED9),
      Color(0xFF6EA6F1),

      wie bier:
      Color(0xFFEAA84A),
      Color(0xFFCC700F),

   */

  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFEAA84A),
      Color(0xFFCC700F),
    ],
  ));

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: displayWidth,
          height: displayHeight,
          decoration: backgroundDecoration,
          child: Stack(
            children: [
              Container(
                child: const Rive.RiveAnimation.asset(
                  'assets/animations/blasen.riv',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomIconButton.IconButton(
                          text: "Spielregeln",
                          assetPath: "assets/icons/rules_icon.png",
                          onTap: () => print("Spielregeln"),
                        ),
                        CustomIconButton.IconButton(
                          text: "Credits",
                          assetPath: "assets/icons/credits_icon.png",
                          onTap: () => print("Credits"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: displayWidth / 1.2,
                      child: Card(
                        color: Color(0xE0443E38),
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: displayHeight / 20,
                            ),
                            const Text(
                              "DrunkGuesser",
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Quicksand",
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: displayHeight / 14,
                            ),
                            Container(
                                width: displayWidth / 1.4,
                                height: 200,
                                child: const Rive.RiveAnimation.asset(
                                    'assets/animations/drunkguesser2.1.riv')),
                            SizedBox(
                              height: displayHeight / 18,
                            ),
                            const RoundedButton(
                              buttonText: "Start",
                              borderRadius: 15,
                              firstColor: Color(0xE0FFA34B),
                              secondColor: Color(0xFFCC700F),
                            ),
                            SizedBox(
                              height: displayHeight / 40,
                            ),
                            const RoundedButton(
                              buttonText: "Sprachen",
                              borderRadius: 15,
                              firstColor: Color(0xE0FFA34B),
                              secondColor: Color(0xFFCC700F),
                            ),
                            SizedBox(
                              height: displayHeight / 9,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
