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

// underscore before QuizState means that this class is private
// and should only be usable within this file
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
  // Underscore means that these methods and properties
  // can only be used within this file
  List<String> _selectedAnswers = [];

  void _switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    Widget screenWidget = StartScreen(_switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
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
