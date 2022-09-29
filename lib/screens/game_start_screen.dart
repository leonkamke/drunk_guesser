import 'package:auto_size_text/auto_size_text.dart';
import 'package:drunk_guesser/database/drunk_guesser_db.dart';
import 'package:flutter/material.dart';

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

  Future<void> initGame(BuildContext context) async {
    // Get selectedCategories
    List<Category> selectedCategories =
    ModalRoute.of(context)?.settings.arguments as List<Category>;
    // Print selected categories
    questions = await DrunkGuesserDB.getQuestions(selectedCategories);
  }

  @override
  void didChangeDependencies() {
    initGame(context);
    super.didChangeDependencies();
  }

  late List<Question> questions;

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
          child: Column(
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
        ),
      ),
    );
  }

  void startGame(BuildContext context) {
    // PushReplace GameScreen and give questions as argument
    Navigator.of(context).pushReplacementNamed("/game", arguments: questions);
  }

  final String startText =
      "Holt eure Notitzen auf dem Handy raus und es kann losgehen!\n\nWer am schlechtesten schätzt trinkt!\n\nViel Spaß!";
}
