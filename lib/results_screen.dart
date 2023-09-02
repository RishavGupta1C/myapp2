import 'package:flutter/material.dart';
import 'package:myapp2/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    Key? key,
    required this.chosenAnswers,
  }) : super(key: key);

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
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
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Answered Correctly'),
            SizedBox(height: 30),
            Text('List of Answers'),
            SizedBox(height: 30),
            TextButton(onPressed: () {}, child: Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
