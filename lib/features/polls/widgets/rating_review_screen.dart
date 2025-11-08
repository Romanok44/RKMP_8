import 'package:flutter/material.dart';
import '../models/poll_result.dart';
import '../../../shared/app_state.dart';
import '../../../shared/service_locator.dart';
import '../state/history_service.dart';

class RatingReviewScreen extends StatelessWidget {
  final String pollId;
  final String pollTitle;
  final String pollCategory;
  final String pollResult;
  final VoidCallback onComplete;

  const RatingReviewScreen({
    super.key,
    required this.pollId,
    required this.pollTitle,
    required this.pollCategory,
    required this.pollResult,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Оцените опрос'),
        backgroundColor: Colors.blue[700],
      ),
      body: _RatingReviewForm(
        pollId: pollId,
        pollTitle: pollTitle,
        pollCategory: pollCategory,
        pollResult: pollResult,
        onComplete: onComplete,
      ),
    );
  }
}

class _RatingReviewForm extends StatefulWidget {
  final String pollId;
  final String pollTitle;
  final String pollCategory;
  final String pollResult;
  final VoidCallback onComplete;

  const _RatingReviewForm({
    required this.pollId,
    required this.pollTitle,
    required this.pollCategory,
    required this.pollResult,
    required this.onComplete,
  });

  @override
  State<_RatingReviewForm> createState() => _RatingReviewFormState();
}

class _RatingReviewFormState extends State<_RatingReviewForm> {
  int _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  void _saveAndComplete() {
    final historyService = getIt<HistoryService>();
    final appState = AppState.of(context);

    final result = PollResult(
      id: widget.pollId,
      title: widget.pollTitle,
      category: widget.pollCategory,
      date: DateTime.now(),
      result: widget.pollResult,
      rating: _rating,
      review: _reviewController.text,
    );

    historyService.addResult(result);
    appState.incrementCompletedPollsCount();
    widget.onComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Как вам опрос?',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Заголовок опроса
          Text(
            widget.pollTitle,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // Выбор оценки
          const Text(
            'Поставьте оценку:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 40,
                ),
                onPressed: () {
                  setState(() {
                    _rating = index + 1;
                  });
                },
              );
            }),
          ),
          Text(
            _rating == 0 ? 'Без оценки' : '$_rating из 5',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: _rating == 0 ? Colors.grey : Colors.amber[700],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 30),

          // Поле для отзыва
          const Text(
            'Ваш отзыв (необязательно):',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _reviewController,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'Поделитесь своими впечатлениями об опросе...',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(12),
            ),
          ),
          const SizedBox(height: 30),

          // Кнопка сохранения
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _saveAndComplete,
              child: const Text(
                'Сохранить и завершить',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),

          // Кнопка пропуска оценки
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () {
                final historyService = getIt<HistoryService>();
                final appState = AppState.of(context);

                final result = PollResult(
                  id: widget.pollId,
                  title: widget.pollTitle,
                  category: widget.pollCategory,
                  date: DateTime.now(),
                  result: widget.pollResult,
                  rating: 0,
                  review: '',
                );

                historyService.addResult(result);
                appState.incrementCompletedPollsCount();
                widget.onComplete();
              },
              child: const Text(
                'Пропустить оценку',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
}