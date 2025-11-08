import 'package:flutter/material.dart';
import 'history_poll_card.dart';

class CategorySection extends StatelessWidget {
  final String category;
  final List<dynamic> polls;
  final Function(dynamic) onPollTap;

  const CategorySection({
    super.key,
    required this.category,
    required this.polls,
    required this.onPollTap,
  });

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        ...polls.map((poll) => HistoryPollCard(
          title: poll.title,
          date: _formatDate(poll.date),
          rating: poll.rating,
          onTap: () => onPollTap(poll),
        )),
        const SizedBox(height: 16),
      ],
    );
  }
}