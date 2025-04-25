import 'package:flutter/material.dart';
import 'package:personality_project/Screens/QuestionScreen.dart';
import 'package:personality_project/Screens/ResultScreen.dart';
import 'package:personality_project/Screens/StartScreen.dart';
import 'package:personality_project/data/answersoftype.dart';
import 'package:personality_project/data/questions.dart';
import 'package:personality_project/models/personalities.dart';

void main() {
  runApp(const MaterialApp(home: Personality()));
}

class Personality extends StatefulWidget {
  const Personality({super.key});

  @override
  State<StatefulWidget> createState() => _Personality();
}

class _Personality extends State<Personality> {
  late Widget activescreen;
  int questionindex = 0;
  late Map<PersonalityType, int> results;

  void Quiz({String? answer}) {
    if (answer != null) {
      final type = answerToTypeMap[answer] ?? PersonalityType.Thinker;
      results[type] = (results[type] ?? 0) + 1;
    }
    setState(() {
      activescreen = test();
      questionindex++;
    });
  }

  void RestartQuiz() {
    setState(() {
      questionindex = 0;
      activescreen = StartScreen(Quiz);
    });
  }

  PersonalityType getMaxPersonality(Map<PersonalityType, int> results) {
    // Find the entry with the maximum value
    final maxEntry = results.entries.reduce(
      (a, b) => a.value > b.value ? a : b,
    );

    // Return the key (PersonalityType) with the highest value
    return maxEntry.key;
  }

  Widget test() {
    final winner = getMaxPersonality(results);
    return questionindex < questions.length
        ? QuestionScreen(Quiz, questions[questionindex])
        : ResultScreen(RestartQuiz, winner);
  }

  @override
  void initState() {
    super.initState();
    activescreen = StartScreen(Quiz);
    results = {for (var type in PersonalityType.values) type: 0};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlue, Colors.blue],
          ),
        ),
        child: activescreen,
      ),
    );
  }
}
