import 'package:flutter/material.dart';
import 'package:myapp2/questions_screen.dart';
import 'package:myapp2/start_screen.dart';
import 'package:myapp2/data/questions.dart';
import 'package:myapp2/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // First method to call questionsScreen using
  // startQuiz Button Click Present in StartScreen
  // Widget? activeScreen;

  // // Lifting Up State
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionsScreen();
  //   });
  // }

  // Second Method
  var activeScreen = 'start-screen';
  // This list can be final as we are just adding to the existing list
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(
      () {
        activeScreen = 'questions-screen';
      },
    );
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'start-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueAccent,
                Colors.pinkAccent,
              ],
              begin: gradientStartAlignment,
              end: gradientEndAlignment,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
