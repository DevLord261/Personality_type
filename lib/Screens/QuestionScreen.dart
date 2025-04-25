import 'package:flutter/material.dart';
import 'package:personality_project/models/Questions.dart';

class QuestionScreen extends StatelessWidget {
  final Questions currentquestion;
  final void Function({String? answer}) Quiz;
  const QuestionScreen(this.Quiz, this.currentquestion, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentquestion.questions,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 20),
          ...currentquestion.getShuffledAnswers().map((answer) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Quiz(answer: answer);
                },
                child: Text(answer),
              ),
            );
          }),
        ],
      ),
    );
  }
}
