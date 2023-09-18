import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:drunk_guesser/database/drunk_guesser_db.dart';
import 'package:drunk_guesser/models/admob_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart' as rive;

import '../models/app_colors.dart';
import '../models/background_icons.dart';
import '../models/category.dart';
import '../models/entitlements.dart';
import '../models/question.dart';
import '../provider/textfield_provider.dart';
import '../widgets/custom_textfield.dart';

class GameStartScreen extends StatefulWidget {
  GameStartScreen({Key? key}) : super(key: key);

  @override
  State<GameStartScreen> createState() => _GameStartScreenState();
}

class _GameStartScreenState extends State<GameStartScreen> {
  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.backgroundHomeScreen_1,
      AppColors.backgroundHomeScreen_2,
    ],
  ));

  late List<Category> selectedCategories;

  Future<void> initGame(BuildContext context) async {
    if (Entitlements.showAds) {
      await AdMobProvider.createInterstitialAd();
    }
    // Get selectedCategories
    selectedCategories =
        ModalRoute.of(context)?.settings.arguments as List<Category>;
    // Print selected categories
    // questions = await DrunkGuesserDB.getQuestions(selectedCategories);
  }

  @override
  void didChangeDependencies() {
    initGame(context);
    super.didChangeDependencies();
  }

  List<Question> questions = [];

  rive.Artboard? _riveArtboard;
  rive.StateMachineController? _controller;

  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/animations/drunkguesser_game_1.3.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = rive.RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller = rive.StateMachineController.fromArtboard(
            artboard, "State Machine 1");
        controller?.isActive = false;
        _controller = controller;
        if (controller != null) {
          artboard.addController(controller);
        }
        _riveArtboard = artboard;
      },
    );
  }

  CustomTextField customTextfield = CustomTextField(
    baseColor: Colors.transparent,
    borderColor: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    // Get the padding of the safe area
    EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;

    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height - safeAreaPadding.top - safeAreaPadding.bottom;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => startGame(context),
        child: Container(
          width: displayWidth,
          height: displayHeight,
          decoration: backgroundDecoration,
          child: Stack(
            children: [
              ...BackgroundIcons.getImages(context),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.fromLTRB(
                      displayWidth * 0.06,
                      displayHeight * 0.02,
                      displayWidth * 0.06,
                      displayHeight * 0.01,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Expanded(
                          child: Text(
                            "a",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.transparent,
                              fontFamily: "Quicksand",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: const Icon(
                            Icons.close_rounded,
                            size: 36, // --
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.fromLTRB(0, 0, 0, displayHeight * 0.045),
                      //color: Colors.black38,
                      alignment: Alignment.center,
                      child: SizedBox(
                        // color: Colors.black45,
                        height: displayHeight * 0.6,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Positioned(
                              top: 0,
                              child: SizedBox(
                                width: displayHeight * 0.18,
                                height: displayHeight * 0.18,
                                child: const rive.RiveAnimation.asset(
                                  'assets/animations/drunkguesser2.2.riv',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Container(
                              width: displayWidth * 0.8,
                              height: displayHeight * 0.5,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: displayWidth * 0.05,
                                vertical: displayWidth * 0.05,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: AppColors.gameCard,
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: AutoSizeText(
                                        startText,
                                        style: const TextStyle(
                                          color: AppColors.schriftFarbe_dunkel,
                                          fontFamily: "Quicksand",
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: displayHeight * 0.088,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> startGame(BuildContext context) async {
    Question question = await DrunkGuesserDB.getQuestion(selectedCategories);
    context.read<TextFieldProvider>().setEnabled(true);
    Navigator.of(context).pushReplacementNamed("/game", arguments: {
      "selectedCategories": selectedCategories,
      "question": question,
      "artboard": _riveArtboard,
      "controller": _controller,
    });
  }

  final String startText =
      "Holt eure Handynotizen raus und los geht’s!\n\nDurch Klicken auf diese Karte beginnt das Spiel.\n\nWer am schlechtesten schätzt, trinkt!\n\n\nViel Spaß!";
}
