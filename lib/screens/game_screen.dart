import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/app_colors.dart';
import '../models/question.dart';
import '../widgets/custom_dialog.dart';

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
    categoryName = questions[0].category.name;
    super.didChangeDependencies();
  }

  late String text;
  late String categoryName;
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
            children: [
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.fromLTRB(
                  displayWidth * 0.1,
                  displayHeight * 0.05,
                  displayWidth * 0.1,
                  displayHeight * 0.025,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        categoryName,
                        style: const TextStyle(
                          fontSize: 30,
                          color: AppColors.appBarText,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.close_rounded,
                        size: 45,
                        color: AppColors.appBarText,
                      ),
                      onTap: () {
                        // Navigator.of(context).pop();
                        _showAlertDialog(context);
                      },
                    ),
                  ],
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
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(3, 6),
                        blurRadius: 6)
                  ],
                  color: AppColors.gameCard,
                ),
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
          // click on question
          text = questions[0].answer;
          questions.removeAt(0);
          isQuestion = false;
        } else if (!isQuestion && questions.isNotEmpty) {
          // click on answer
          text = questions[0].question;
          categoryName = questions[0].category.name;
          isQuestion = true;
        }
      },
    );
    // Check if no more questions
    if (questions.isEmpty) {
      // end of the round
      Navigator.of(context).pushReplacementNamed("/game_end");
    }
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(context: context,
        builder: (BuildContext context){
          return CustomDialogBox(
            description: "Seid ihr sicher, dass ihr das Spiel verlassen wollt?",
          );
        },
      barrierColor: Color(0xA9000000),
    );


    /* showCupertinoDialog(
      context: context,
      builder: (context) {
        return Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(
            content: const Text(
              "Seid ihr sicher, dass ihr das Spiel verlassen wollt?",
              style: TextStyle(color: Colors.white, fontSize: 19),
            ),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                /// This parameter indicates this action is the default,
                /// and turns the action's text to bold text.
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Nein",
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
              CupertinoDialogAction(
                /// This parameter indicates the action would perform
                /// a destructive action such as deletion, and turns
                /// the action's text color to red.
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Ja",
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
              ),
            ],
          ),
        );
      },
    );
     */
  }
}
