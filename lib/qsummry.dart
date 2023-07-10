import 'package:flutter/material.dart';

class QuestionSummry extends StatelessWidget {
  const QuestionSummry(this.summryData, {super.key});
  final List<Map<String, Object>> summryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
            children: summryData.map((data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 13,
                backgroundColor: Color.fromARGB(255, 148, 147, 147),
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['questions'] as String,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.question_answer_rounded,
                            color: Color.fromARGB(255, 131, 116, 116),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 248, 46, 32),
                                fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Color.fromARGB(255, 15, 143, 19),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 15, 143, 19),
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }).toList()),
      ),
    );
  }
}
