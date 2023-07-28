import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 28,
                    width: 28,
                    padding: const EdgeInsets.all(6),
                    margin: const EdgeInsets.fromLTRB(15, 10, 35, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: data['user_answer'] == data['correct_answer']
                          ? const Color.fromARGB(255, 119, 160, 231)
                          : const Color.fromARGB(255, 185, 91, 178),
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(210, 231, 231, 231),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 185, 91, 178)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 119, 160, 231)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
