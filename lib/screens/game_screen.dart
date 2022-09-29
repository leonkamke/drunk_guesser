import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/app_colors.dart';
import '../models/question.dart';

class GameScreen extends StatefulWidget {
  GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var backgroundDecoration = const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.backgroundHomeScreen_1,
      AppColors.backgroundHomeScreen_2,
    ],
  ));

  late List<Question> questions;

  @override
  void didChangeDependencies() {
    questions = ModalRoute.of(context)?.settings.arguments as List<Question>;
    for (Question q in questions) {
      print(q.question);
    }
    text = questions[0].question;
    super.didChangeDependencies();
  }

  late String text;
  bool isQuestion = true;


  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => gameHandler(),
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
                  text,
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

  void gameHandler() {
    setState(
      () {
       if (isQuestion) {
         text = questions[0].answer;
         questions.removeAt(0);
         isQuestion = false;
       } else if (questions.isNotEmpty) {
         text = questions[0].question;
         isQuestion = true;
       } else {
         // pushreplaced game_end_screen
       }
      },
    );
  }

}
