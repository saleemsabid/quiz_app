import 'package:flutter/material.dart';
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
  // Widget? activeScreen;
  var activeScreen = 'splash-screen';
  // @override
  // void initState() {
  //   activeScreen = SplashScreen(switchScreen);
  //   super.initState();
  // }

  switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
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
                : const QuestionsScreen(),
          ),
        ),
      ),
    );
  }
}
