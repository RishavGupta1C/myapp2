import 'package:flutter/material.dart';
import 'package:myapp2/data/questions.dart';
import 'package:myapp2/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    Key? key,
    required this.chosenAnswers,
    required this.onRestart,
  }) : super(key: key);

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryList() {
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
    final summaryList = getSummaryList();
    final numTotalQuestions = questions.length;
    // just like map, where does not change the original list
    final numCorrectQuestions = summaryList.where((summaryData) {
      return summaryData['user_answer'] == summaryData['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of'
              '$numTotalQuestions questions correctly',
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
