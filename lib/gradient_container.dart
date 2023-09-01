import 'package:flutter/material.dart';

const gradientStartAlignment = Alignment.topLeft;
const gradientEndAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png'),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: getQuestion,
            child: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }

  void getQuestion() {}
}
