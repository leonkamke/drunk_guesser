import 'package:auto_size_text/auto_size_text.dart';
import 'package:drunk_guesser/database/drunk_guesser_db.dart';
import 'package:drunk_guesser/models/background_icons.dart';
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

  // For drunkguesser animation above the card
  late rive.Artboard _riveArtboard;
  rive.StateMachineController? _controller;

  @override
  void initState() {
    super.initState();

    /*
    rootBundle.load('assets/animations/drunkguesser_game_1.3.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = rive.RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller =
            rive.StateMachineController.fromArtboard(artboard, "DrunkGuesserSM");
        if (controller != null) {
          artboard.addController(controller);
        }
        _riveArtboard = artboard;
      },
    );
    */

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
      Map arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
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
    // Get the padding of the safe area
    EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;

    final displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height -
        safeAreaPadding.top -
        safeAreaPadding.bottom;

    Map arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    _riveArtboard = arguments["artboard"] as rive.Artboard;
    _controller = arguments["controller"] as rive.StateMachineController;
    _controller?.isActive = true;
    return WillPopScope(
      onWillPop: () => _showAlertDialog(context),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: colors[1],
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            reverse: true,
            child: Container(
              width: displayWidth,
              height: displayHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: colors,
                ),
              ),
              child: Stack(
                children: [
                  ...BackgroundIcons.getImages(context),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 82,
                        color: Colors.transparent,
                        padding: EdgeInsets.fromLTRB(
                          displayWidth * 0.06,
                          displayHeight * 0.02,
                          displayWidth * 0.06,
                          displayHeight * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: FittedBox(
                                alignment: Alignment.topLeft,
                                fit: BoxFit.scaleDown,
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
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                              child: GestureDetector(
                                child: const Icon(
                                  Icons.close_rounded,
                                  size: 33, // --
                                  color: AppColors.appBarText,
                                ),
                                onTap: () {
                                  // Navigator.of(context).pop();
                                  _showAlertDialog(context);
                                },
                              ),
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
                            child: SizedBox(
                              // color: Colors.black45,
                              height: displayHeight * 0.6,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Positioned(
                                    top: -displayHeight * 0.12,
                                    child: Container(
                                        width: displayHeight * 0.35,
                                        height: displayHeight * 0.35,
                                        child: rive.Rive(
                                          artboard: _riveArtboard,
                                        )),
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
                                        color: AppColors.gameCard,
                                      ),
                                      child: FadeTransition(
                                        opacity: _controllerText,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: displayHeight * 0.09,
                                              child: AutoSizeText(
                                                isQuestion
                                                    ? "Frage"
                                                    : "Antwort",
                                                style: const TextStyle(
                                                  color: AppColors
                                                      .schriftFarbe_dunkel,
                                                  fontFamily: "Quicksand",
                                                  fontSize: 39,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: AutoSizeText(
                                                  text,
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
                            bottom: displayHeight * 0.057,
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

  /*
        ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
   */

  int numberQuestions = 1;

  Future<void> gameHandler() async {
    // Change to GameEndScreen after 18 questions and click on answer
    if (numberQuestions >= 10 && !isQuestion) {
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
      if (isQuestion) {
        _controller?.init(rive.RuntimeArtboard());
      }
    }
  }

  Future<bool> _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        /*
        return CustomDialogBox(
          description: "Seid ihr sicher, dass ihr das Spiel verlassen wollt?",
        );*/

        return AlertDialog(
          // title: const Text('AlertDialog Title'),
          backgroundColor: const Color(0xFFF5F5F5),
          contentPadding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
          content: const Text(
            'Seid ihr sicher, dass ihr das Spiel verlassen wollt?',
            style: TextStyle(
                color: AppColors.appBarText,
                fontSize: 18,
                fontFamily: "Quicksand",
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                'Ja',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Nein',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
      barrierColor: const Color(0xA9000000),
    );
    return Future<bool>(() {
      return false;
    });
  }
}
