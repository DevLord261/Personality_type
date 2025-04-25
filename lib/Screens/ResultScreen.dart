import 'package:flutter/material.dart';
import 'package:personality_project/models/personalities.dart';

class ResultScreen extends StatelessWidget {
  final PersonalityType results;
  final void Function() RestartQuiz;

  // Correct way to declare the constructor and use the parameter
  ResultScreen(this.RestartQuiz, this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            personalitymessage[results] ?? "$results",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () {
              RestartQuiz();
            },
            child: Text(
              "restart Test",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
