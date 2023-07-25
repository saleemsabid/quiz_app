import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.text, required this.onTap, super.key});
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // minimumSize: const Size(200, 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 36, 19, 66),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
