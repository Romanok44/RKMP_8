import 'package:flutter/material.dart';
import 'answer_button.dart';

class PollQuestionScreen extends StatelessWidget {
  final String question;
  final List<Map<String, dynamic>> answers;
  final String appBarTitle;
  final Color backgroundColor;

  const PollQuestionScreen({
    super.key,
    required this.question,
    required this.answers,
    this.appBarTitle = "Вопрос",
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              question,
              style: const TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...answers.map((answer) => Column(
              children: [
                AnswerButton(
                  text: answer['text'],
                  onPressed: answer['onPressed'],
                ),
                const SizedBox(height: 10),
              ],
            )),
          ],
        ),
      ),
    );
  }
}