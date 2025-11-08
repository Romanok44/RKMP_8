import 'package:flutter/material.dart';
import '../../polls/widgets/category_section.dart';
import '../../polls/widgets/confirmation_dialog.dart';
import '../widgets/empty_history_state.dart';
import '../../../shared/service_locator.dart';
import '../../polls/state/history_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late final HistoryService historyService;

  @override
  void initState() {
    super.initState();
    historyService = getIt<HistoryService>();
  }

  Map<String, List<dynamic>> _groupPollsByCategory(List<dynamic> polls) {
    final grouped = <String, List<dynamic>>{};
    for (final poll in polls) {
      final category = poll.category;
      if (!grouped.containsKey(category)) {
        grouped[category] = [];
      }
      grouped[category]!.add(poll);
    }
    return grouped;
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }

  void _showClearConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: 'Очистить историю',
        content: 'Вы уверены, что хотите удалить все результаты?',
        onConfirm: () => historyService.clearHistory(),
      ),
    );
  }

  void _showResultDialog(dynamic poll) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(poll.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Категория: ${poll.category}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              'Дата: ${_formatDate(poll.date)}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text(
              'Результат:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              poll.result,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            if (poll.rating > 0) ...[
              const SizedBox(height: 16),
              const Text(
                'Оценка:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    index < poll.rating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 20,
                  );
                }),
              ),
            ],

            if (poll.review.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text(
                'Ваш отзыв:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                poll.review,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('История опросов'),
        backgroundColor: Colors.blue[700],
        actions: [
          if (historyService.results.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _showClearConfirmationDialog,
              tooltip: 'Очистить историю',
            ),
        ],
      ),
      body: ListenableBuilder(
        listenable: historyService,
        builder: (context, child) {
          final completedPolls = historyService.results;
          final groupedPolls = _groupPollsByCategory(completedPolls);

          return completedPolls.isEmpty
              ? const EmptyHistoryState()
              : ListView(
            children: groupedPolls.entries.map((entry) {
              return CategorySection(
                category: entry.key,
                polls: entry.value,
                onPollTap: (poll) => _showResultDialog(poll),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}