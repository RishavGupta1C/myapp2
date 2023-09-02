import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  // Positional Argument
  // AnswerButton(this.answerText, this.onTap, {Key? key,}) : super(key: key);

  // Named Argument are optional by default
  // So we need to use required to make them non-optional
  const AnswerButton({
    Key? key,
    required this.answerText,
    required this.onTap,
  }) : super(key: key);

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: const Color.fromARGB(255, 138, 29, 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(answerText),
    );
  }
}
