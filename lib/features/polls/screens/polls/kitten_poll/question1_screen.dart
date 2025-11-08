import 'package:flutter/material.dart';
import '../../../widgets/poll_question_screen.dart';
import 'question2_screen.dart';

class Question1Screen extends StatelessWidget {
  const Question1Screen({super.key});

  void _navigateToNext(BuildContext context, int score) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Question2Screen(score: score)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PollQuestionScreen(
      appBarTitle: "Вопрос 1/5",
      question: "Твой будильник прозвенел. Первая мысль?",
      answers: [
        {
          'text': '"Уже?! Еще пять минуточек..."',
          'onPressed': () => _navigateToNext(context, -1),
        },
        {
          'text': '"Время начинать день! Столько всего интересного!"',
          'onPressed': () => _navigateToNext(context, 2),
        },
        {
          'text': '"Мой день начнется тогда, когда я сам этого захочу."',
          'onPressed': () => _navigateToNext(context, 0),
        },
      ],
    );
  }
}