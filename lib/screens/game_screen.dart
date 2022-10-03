import 'package:auto_size_text/auto_size_text.dart';
import 'package:drunk_guesser/provider/textfield_provider.dart';
import 'package:drunk_guesser/widgets/scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_colors.dart';
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

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 450),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(0.5, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void didChangeDependencies() {
    if (start) {
      questions = ModalRoute.of(context)?.settings.arguments as List<Question>;
      for (Question q in questions) {
        print(q.question);
      }
      text = questions[0].question;
      colors = questions[0].category.colors;
      categoryName = questions[0].category.name;
      start = false;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            size: 36,
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
                  GestureDetector(
                    onTap: () => gameHandler(),
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
                      child: SlideTransition(
                        position: _animation,
                        child: AutoSizeText(
                          text,
                          key: ValueKey<String>(text),
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
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 10,
                        bottom: 20,
                        left: displayWidth * 0.1,
                        right: displayWidth * 0.1),
                    child: customTextfield,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> gameHandler() async {
    _controller.reset();
    _controller.forward();
    setState(
      () {
        if (isQuestion) {
          // click on question
          text = questions[0].answer;
          questions.removeAt(0);
          isQuestion = false;
          context.read<TextFieldProvider>().setEnabled(false);
          if (customTextfield.controller.text == "") {
            customTextfield.controller.text = " ";
          }
        } else if (!isQuestion && questions.isNotEmpty) {
          // click on answer
          text = questions[0].question;
          colors = questions[0].category.colors;
          categoryName = questions[0].category.name;
          isQuestion = true;
          context.read<TextFieldProvider>().setEnabled(true);
          customTextfield.controller.text = "";
        }
      },
    );
    // Check if no more questions
    if (questions.isEmpty) {
      // end of the round
      Navigator.of(context).pushReplacementNamed("/game_end");
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
}
