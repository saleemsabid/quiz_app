import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/splash_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'splash-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'splash-screen';
        selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 95, 48, 177),
                Color.fromARGB(255, 126, 40, 184),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: activeScreen == 'splash-screen'
                ? SplashScreen(switchScreen)
                : QuestionsScreen(onSelectAnswer: chooseAnswer),
          ),
        ),
      ),
    );
  }
}
