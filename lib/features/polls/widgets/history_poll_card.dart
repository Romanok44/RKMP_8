import 'package:flutter/material.dart';

class HistoryPollCard extends StatelessWidget {
  final String title;
  final String date;
  final int rating;
  final VoidCallback onTap;

  const HistoryPollCard({
    super.key,
    required this.title,
    required this.date,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: const Icon(Icons.quiz, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Пройдено: $date'),
            if (rating > 0)
              Row(
                children: [
                  ...List.generate(rating, (index) =>
                  const Icon(Icons.star, color: Colors.amber, size: 16)),
                  ...List.generate(5 - rating, (index) =>
                  const Icon(Icons.star_border, color: Colors.grey, size: 16)),
                ],
              ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}