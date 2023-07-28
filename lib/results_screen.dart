import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {required this.chosenAnswers, required this.onRestart, super.key});
  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'You answered $numCorrectQuestion out of $numTotalQuestion questions correctly!',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 230, 200, 253),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz!'),
                onPressed: onRestart,
              ),
            ]),
      ),
    );
  }
}
