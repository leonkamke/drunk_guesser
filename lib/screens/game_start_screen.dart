import 'package:auto_size_text/auto_size_text.dart';
import 'package:drunk_guesser/database/drunk_guesser_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart' as rive;

import '../models/app_colors.dart';
import '../models/category.dart';
import '../models/question.dart';

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

  void initGame(BuildContext context) {
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
        controller?.isActive = true;
        _controller = controller;
        if (controller != null) {
          artboard.addController(controller);
        }
        _riveArtboard = artboard;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => startGame(context),
        child: Container(
          width: displayWidth,
          height: displayHeight,
          decoration: backgroundDecoration,
          // alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ...getImages(context),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: displayWidth * 0.05,
                      vertical: displayWidth * 0.05,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(3, 6),
                            blurRadius: 6)
                      ],
                      color: AppColors.gameCard,
                    ),
                    width: displayWidth * 0.8,
                    height: displayHeight * 0.5,
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
    Navigator.of(context).pushReplacementNamed("/game", arguments: {
      "selectedCategories": selectedCategories,
      "question": question,
      "artboard": _riveArtboard,
      "controller": _controller,
    });
  }

  final String startText =
      "Holt eure Notitzen auf dem Handy raus und es kann losgehen!\n\nWer am schlechtesten schätzt trinkt!\n\nViel Spaß!";

  List<Widget> getImages(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    double iconHeight = displayWidth * 0.182;
    Color iconColor = Color(0xB000000);
    return [
      Positioned(
        top: displayHeight * 0.05,
        left: displayWidth * 0.1,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        top: displayHeight * 0.09,
        left: displayWidth * 0.5,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        top: displayHeight * 0.28,
        left: displayWidth * 0.04,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        top: displayHeight * 0.32,
        left: displayWidth * 0.8,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),

      // ----------------

      Positioned(
        bottom: displayHeight * 0.05,
        right: displayWidth * 0.1,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        bottom: displayHeight * 0.09,
        right: displayWidth * 0.5,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        bottom: displayHeight * 0.28,
        right: displayWidth * 0.04,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        bottom: displayHeight * 0.32,
        right: displayWidth * 0.8,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
      Positioned(
        bottom: displayHeight * 0.02,
        right: displayWidth * 0.8,
        child: Icon(
          Icons.sports_bar_outlined,
          size: iconHeight,
          color: iconColor,
        ),
      ),
    ];
  }
}
