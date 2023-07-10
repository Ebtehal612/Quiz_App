import 'package:flutter/material.dart';
import 'package:quiz_app/data/que.dart';
import 'package:quiz_app/qsummry.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.chosenAns, required this.reStart});
  final void Function() reStart;
  final List<String> chosenAns;
  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> Summary = [];
    for (var i = 0; i < chosenAns.length; i++) {
      Summary.add({
        'question_index': i,
        'questions': ques[i].text,
        'correct_answer': ques[i].answers[0],
        'user_answer': chosenAns[i]
      });
    }
    return Summary;
  }

  @override
  Widget build(context) {
    final summaruData = getSummary();
    final numTotalQ = 4;
    final numCorrectQ = summaruData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'You answered $numCorrectQ out $numTotalQ questions correctly!',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionSummry(summaruData),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.restart_alt_sharp,
                      color: Colors.white,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: reStart,
                        child: const Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            'Restart Quiz!',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
