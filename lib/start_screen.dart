import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const gradientStartAlignment = Alignment.topLeft;
const gradientEndAlignment = Alignment.bottomRight;

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {Key? key}) : super(key: key);

  final void Function() startQuiz;

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
          Text(
            'Learn Flutter The Fun Way!',
            style: GoogleFonts.raleway(
              color: const Color.fromARGB(255, 236, 226, 226),
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: startQuiz, // pointer to startQuiz Function
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                    color: Color.fromARGB(100, 255, 255, 255),
                    width: 1,
                  ),
                ),
              ),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Color.fromARGB(200, 255, 255, 255),
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                color: Color.fromARGB(200, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
