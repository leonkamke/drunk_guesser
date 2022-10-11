import 'package:auto_size_text/auto_size_text.dart';
import 'package:drunk_guesser/database/drunk_guesser_db.dart';
import 'package:drunk_guesser/provider/textfield_provider.dart';
import 'package:drunk_guesser/widgets/scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart' as rive;

import '../models/app_colors.dart';
import '../models/category.dart';
import '../models/question.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_textfield.dart';

class GameScreen extends StatefulWidget {
  GameScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  late List<Question> questions;
  bool start = true;

  late AnimationController _controllerCard;
  late Animation<Offset> _animationCard;

  late AnimationController _controllerText;

  @override
  void initState() {
    super.initState();

    _controllerCard = AnimationController(
      duration: const Duration(milliseconds: 810),
      vsync: this,
    )..forward();

    _animationCard = Tween<Offset>(
      begin: const Offset(0.5, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controllerCard,
      curve: Curves.elasticOut,
    ));

    _controllerText = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..forward();
  }

  late List<Category> selectedCategories;
  late Question question;

  @override
  void didChangeDependencies() {
    if (start) {
      /*
      questions = ModalRoute.of(context)?.settings.arguments as List<Question>;
      for (Question q in questions) {
        print(q.question);
      }
      text = questions[0].question;
      colors = questions[0].category.colors;
      categoryName = questions[0].category.name;
      start = false;*/
      Map arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      selectedCategories = arguments["selectedCategories"] as List<Category>;
      question = arguments["question"] as Question;
      text = question.question;
      colors = question.category.colors;
      categoryName = question.category.name;
      start = false;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controllerText.dispose();
    _controllerCard.dispose();
    super.dispose();
  }

  late String text;
  late String categoryName;
  bool isQuestion = true;
  late List<Color> colors;

  CustomTextField customTextfield = CustomTextField(
    baseColor: AppColors.gameCard,
    borderColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () => _showAlertDialog(context),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: colors[1],
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Container(
              width: displayWidth,
              height: displayHeight,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colors,
              )),
              child: Stack(
                children: [
                  ...getImages(context),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.fromLTRB(
                          displayWidth * 0.1,
                          displayHeight * 0.05, // ---
                          displayWidth * 0.1,
                          displayHeight * 0.01, // ---
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
                                size: 36, // --
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
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              0, 0, 0, displayHeight * 0.045),
                          //color: Colors.black38,
                          alignment: Alignment.center,
                          child: SlideTransition(
                            position: _animationCard,
                            child: Container(
                              // color: Colors.black45,
                              height: displayHeight * 0.6,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: displayWidth * 0.23,
                                    child: Container(
                                      width: displayHeight * 0.17,
                                      height: displayHeight * 0.17,
                                      child: const rive.RiveAnimation.asset(
                                        'assets/animations/drunkguesser2.2.riv',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => gameHandler(),
                                    // GameCard
                                    child: Container(
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
                                      child: FadeTransition(
                                        opacity: _controllerText,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                AutoSizeText(
                                                  isQuestion ? "Frage" : "Antwort",
                                                  style: const TextStyle(
                                                    color: AppColors
                                                        .schriftFarbe_dunkel,
                                                    fontFamily: "Quicksand",
                                                    fontSize: 39,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: AutoSizeText(
                                                  text,
                                                  key: ValueKey<String>(text),
                                                  style: const TextStyle(
                                                    color: AppColors
                                                        .schriftFarbe_dunkel,
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.only(
                            top: 0,
                            bottom: 20,
                            left: displayWidth * 0.1,
                            right: displayWidth * 0.1),
                        child: customTextfield,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int numberQuestions = 1;

  Future<void> gameHandler() async {
    // Change to GameEndScreen after 18 questions and click on answer
    if (numberQuestions >= 5 && !isQuestion) {
      // end of the round
      Navigator.of(context).pushReplacementNamed("/game_end");
    } else {
      if (isQuestion) {
        // Mark question as read
        await DrunkGuesserDB.markAsRead(question.category.dbName, question.id);
      } else {
        // Get next question
        question = await DrunkGuesserDB.getQuestion(selectedCategories);
      }
      setState(
            () {
          if (isQuestion) {
            // click on question
            _controllerText.reset();
            _controllerText.forward();
            text = question.answer;
            // questions.removeAt(0);
            context.read<TextFieldProvider>().setEnabled(false);
            if (customTextfield.controller.text == "") {
              customTextfield.controller.text = " ";
            }
            isQuestion = false;
          } else {
            // click on answer
            numberQuestions++;
            _controllerCard.reset();
            _controllerCard.forward();
            text = question.question;
            colors = question.category.colors;
            categoryName = question.category.name;
            context.read<TextFieldProvider>().setEnabled(true);
            customTextfield.controller.text = "";
            isQuestion = true;
          }
        },
      );
    }
  }

  Future<bool> _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogBox(
          description: "Seid ihr sicher, dass ihr das Spiel verlassen wollt?",
        );
      },
      barrierColor: Color(0xA9000000),
    );
    return Future<bool>(() {
      return false;
    });
  }

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
