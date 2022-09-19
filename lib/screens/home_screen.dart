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
      Color(0xFF536585),
      Color(0xFF304157),
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
        child: Stack(
          children: [
            Container(
              child: /*const rive.RiveAnimation.asset(
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
                          onTap: () {
                            print(displayHeight);
                            Navigator.of(context).pushNamed("/rules");
                          },
                        ),
                        CustomIconButton.IconButton(
                          text: "Credits",
                          assetPath: "assets/icons/credits_icon.png",
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
                      width: displayWidth * 0.83,
                      child: Card(
                        color: const Color(0xFF80A5D7),
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
                          child: Column(
                            children: [
                              const FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "DrunkGuesser",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Quicksand",
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: displayHeight * 0.07,
                              ),
                              Container(
                                  width: displayHeight * 0.7,
                                  height: displayHeight * 0.25,
                                  padding: const EdgeInsets.all(5),
                                  child: const rive.RiveAnimation.asset(
                                    'assets/animations/drunkguesser2.2.riv',
                                    fit: BoxFit.contain,
                                  )),
                              SizedBox(
                                height: displayHeight * 0.05,
                              ),
                              RoundedButton(
                                buttonText: "Start",
                                borderRadius: 15,
                                firstColor: const Color(0xFF5B738F),
                                secondColor: const Color(0xFF5B7394),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed("/categories");
                                },
                              ),
                              SizedBox(
                                height: displayHeight * 0.03,
                              ),
                              RoundedButton(
                                buttonText: "Einstellungen",
                                borderRadius: 15,
                                firstColor: const Color(0xFF5B738F),
                                secondColor: const Color(0xFF5B7394),
                                onTap: () {
                                  Navigator.of(context).pushNamed("/settings");
                                },
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
