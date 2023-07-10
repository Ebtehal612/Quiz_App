import 'package:flutter/material.dart';
import 'package:quiz_app/data/que.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/results.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuisState();
  }
}

class _QuisState extends State<Quiz> {
  List<String> selectedAns = [];
  var active = 'start-screen';

  void switchScreen() {
    setState(() {
      active = 'questions-screen';
    });
  }

  void choose(String answer) {
    selectedAns.add(answer);
    if (selectedAns.length == ques.length) {
      setState(() {
        active = 'results-screen';
      });
    }
  }

  void restart() {
    setState(() {
      selectedAns = [];
      active = 'start_screen';
    });
  }

  @override
  Widget build(context) {
    Widget screevWidget = StartScreen(switchScreen);
    if (active == 'questions-screen') {
      screevWidget = Questions(
        onSelectAns: choose,
      );
    }
    if (active == 'results-screen') {
      screevWidget = Result(
        chosenAns: selectedAns,
        reStart: restart,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(131, 1, 1, 0.98),
                Color.fromRGBO(36, 0, 0, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screevWidget,
        ),
      ),
    );
  }
}
