import 'package:drunk_guesser/screens/credits_screen.dart';
import 'package:drunk_guesser/widgets/rounded_button.dart';
import 'package:drunk_guesser/widgets/icon_button.dart' as CustomIconButton;
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:rive/rive.dart' as rive;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      Color(0xFF80A5D7),
      Color(0xFF6B9EE3),
    ],
  ));

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    await Future.delayed(const Duration(milliseconds: 1400));
    FlutterNativeSplash.remove();
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
              padding: EdgeInsets.fromLTRB(
                displayWidth * 0.066,
                displayHeight * 0.06,
                displayWidth * 0.066,
                0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomIconButton.IconButton(
                    text: "Spielregeln",
                    assetPath: "assets/icons/rules_icon_dark.png",
                    onTap: () {
                      print(displayHeight);
                      Navigator.of(context).pushNamed("/rules");
                    },
                  ),
                  CustomIconButton.IconButton(
                    text: "Credits",
                    assetPath: "assets/icons/credits_icon_dark.png",
                    onTap: () {
                      print(displayWidth);
                      // Navigate to CreditsScreen
                      Navigator.pushNamed(context, "/credits");
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: displayHeight * 0.07,
            ),
            const FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                "DrunkGuesser",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Quicksand",
                    color: Color(0xFF292F38),
                    shadows: [
                      Shadow(
                        offset: Offset(2.2, 3.2),
                        blurRadius: 9,
                        color: Colors.black54,
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: displayHeight * 0.07,
            ),
            Expanded(
              child: Container(
                  width: 200,
                  height: 200,
                  child: const rive.RiveAnimation.asset(
                    'assets/animations/drunkguesser2.2.riv',
                    fit: BoxFit.contain,
                  )),
            ),
            SizedBox(
              height: displayHeight * 0.07,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, displayHeight * 0.09),
              child: Column(
                children: [
                  RoundedButton(
                    buttonText: "Start",
                    borderRadius: 15,
                    firstColor: Color(0xFF292F38),
                    secondColor: Color(0xFF292F38),
                    onTap: () {
                      Navigator.of(context).pushNamed("/categories");
                    },
                  ),
                  SizedBox(
                    height: displayHeight * 0.03,
                  ),
                  RoundedButton(
                    buttonText: "Einstellungen",
                    borderRadius: 15,
                    firstColor: Color(0xFF292F38),
                    secondColor: Color(0xFF292F38),
                    onTap: () {
                      Navigator.of(context).pushNamed("/settings");
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
