import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectAnswer, super.key});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(currentQuestion.question,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 196, 123, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map(
              (text) {
                return AnswerButton(
                    text: text,
                    onTap: () {
                      answerQuestion(text);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
