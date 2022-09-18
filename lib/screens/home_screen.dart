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

      good light blue: Color(0xFF63A4E1)

   */

  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF3C4D62),
      Color(0xFF304157),
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
              /*Container(
                child: const Rive.RiveAnimation.asset(
                  'assets/animations/blasen.riv',
                  fit: BoxFit.cover,
                ),
              ),*/
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        displayWidth * 0.066,
                        displayHeight * 0.06,
                        displayWidth * 0.066,
                        displayHeight * 0.07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomIconButton.IconButton(
                          text: "Spielregeln",
                          assetPath: "assets/icons/rules_icon.png",
                          onTap: () => print(displayHeight),
                        ),
                        CustomIconButton.IconButton(
                          text: "Credits",
                          assetPath: "assets/icons/credits_icon.png",
                          onTap: () => print(displayWidth),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      width: displayWidth * 0.83,
                      child: Card(
                        color: Color(0xFF80A5D7),
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: displayHeight * 0.05,
                            ),
                            const Text(
                              "DrunkGuesser",
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Quicksand",
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            SizedBox(
                              height: displayHeight * 0.07,
                            ),
                            Container(
                                width: displayHeight * 0.7,
                                height: displayHeight * 0.25,
                                child: const Rive.RiveAnimation.asset(
                                  'assets/animations/drunkguesser2.2.riv',
                                )),
                            SizedBox(
                              height: displayHeight * 0.05,
                            ),
                            const RoundedButton(
                              buttonText: "Start",
                              borderRadius: 15,
                              firstColor: Color(0xFF5B738F),
                              secondColor: Color(0xFF5B7394),
                            ),
                            SizedBox(
                              height: displayHeight * 0.09,
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
