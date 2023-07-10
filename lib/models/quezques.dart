class QuizQuestion {
  QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;
  List<String> getShufAns() {
    final shuffled = List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}
