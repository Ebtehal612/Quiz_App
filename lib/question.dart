import 'package:flutter/material.dart';
import 'package:quiz_app/ansbutton.dart';
import 'package:quiz_app/data/que.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectAns});
  final void Function(String answer) onSelectAns;
  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  var currentIndex = 0;
  void answerQ(String SelectAns) {
    widget.onSelectAns(SelectAns);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQ = ques[currentIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQ.text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQ.getShufAns().map((item) {
              return AnsButton(
                  ansText: item,
                  onTap: () {
                    answerQ(item);
                  });
            })
          ],
        ),
      ),
    );
  }
}
