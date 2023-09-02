class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> getShuffledAnswer() {
    // of is used to copy an eisting list
    // method chaining
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
