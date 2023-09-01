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
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.7,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Learn Flutter The Fun Way!',
            style: TextStyle(
              color: Color.fromARGB(255, 236, 226, 226),
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: getQuestion,
            style: TextButton.styleFrom(
              elevation: 7,
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Color.fromARGB(200, 255, 255, 255),
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getQuestion() {}
}
