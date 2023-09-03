import 'package:flutter/material.dart';
import 'package:myapp2/data/questions.dart';
import 'package:myapp2/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    Key? key,
    required this.chosenAnswers,
    required this.onRestart,
  }) : super(key: key);

  final List<String> chosenAnswers;
  final void Function() onRestart;

  // List<Map<String, Object>> getSummaryList() {
  //   final List<Map<String, Object>> summary = [];

  //   for (var i = 0; i < chosenAnswers.length; i++) {
  //     summary.add({
  //       'question_index': i,
  //       'question': questions[i].text,
  //       'correct_answer': questions[i].answers[0],
  //       'user_answer': chosenAnswers[i],
  //     });
  //   }
  //   return summary;
  // }

  // getter in dart using 'get' keyword
  List<Map<String, Object>> get summaryList {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    // just like map, where does not change the original list
    // because of get keyword summaryList can be used like a property
    // but internally it behaves like a method

    // final numCorrectQuestions = summaryList.where((summaryData) {
    //   return summaryData['user_answer'] == summaryData['correct_answer'];
    // }).length;

    // USING ARROW FUNCTION FOR THOSE FUNCTIONS THAT ONLY HAS RETURN STATEMENT
    final numCorrectQuestions = summaryList
        .where(
          (summaryData) =>
              summaryData['user_answer'] == summaryData['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of'
              ' $numTotalQuestions questions correctly',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryList),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text(
                'Restart Quiz',
              ),
            )
          ],
        ),
      ),
    );
  }
}
