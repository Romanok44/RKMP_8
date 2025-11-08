import 'package:flutter/material.dart';
import '../../../widgets/poll_question_screen.dart';
import 'question4_screen.dart';

class Question3Screen extends StatelessWidget {
  final int score;
  const Question3Screen({super.key, required this.score});

  void _navigateToNext(BuildContext context, int additionalScore) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Question4Screen(score: score + additionalScore),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PollQuestionScreen(
      appBarTitle: "Вопрос 3/5",
      question: "Как пройдет твой день?",
      answers: [
        {
          'text': 'Планово и продуктивно. Я составлю список дел и последую ему.',
          'onPressed': () => _navigateToNext(context, 1),
        },
        {
          'text': 'Я буду исследовать что-то новое и следовать за своим любопытством.',
          'onPressed': () => _navigateToNext(context, 2),
        },
        {
          'text': 'Где мое самое уютное местечко? Идеальный день для отдыха.',
          'onPressed': () => _navigateToNext(context, -1),
        },
      ],
    );
  }
}