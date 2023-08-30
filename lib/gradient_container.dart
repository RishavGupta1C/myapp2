import 'package:flutter/material.dart';

const gradientStartAlignment = Alignment.topLeft;
const gradientEndAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext build) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purpleAccent, Colors.pinkAccent],
          begin: gradientStartAlignment,
          end: gradientEndAlignment,
        ),
      ),
      child: ElevatedButton(
        onPressed: getQuestion,
        child: const Text('Start Quiz'),
      ),
    );
  }

  void getQuestion() {}
}
