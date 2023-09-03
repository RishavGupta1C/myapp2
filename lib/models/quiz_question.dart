class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  // List<String> getShuffledAnswer() {
  //   // of is used to copy an existing list
  //   final shuffledList = List.of(answers);
  //   shuffledList.shuffle();
  //   return shuffledList;
  // }

  // Using getter
  List<String> get shuffledAnswer {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
