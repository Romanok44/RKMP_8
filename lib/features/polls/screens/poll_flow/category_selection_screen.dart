import 'package:flutter/material.dart';
import 'poll_list_screen.dart';

class CategorySelectionScreen extends StatelessWidget {
  const CategorySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите категорию'),
        backgroundColor: Colors.blue[700],
      ),
      body: ListView(
        children: [
          _buildCategoryCard(
            context,
            'Смешные опросы',
            Icons.sentiment_very_satisfied,
            Colors.amber,
            'funny',
          ),
          _buildCategoryCard(
            context,
            'Психологические опросы',
            Icons.psychology,
            Colors.purple,
            'personality',
          ),
          _buildCategoryCard(
            context,
            'Социологические опросы',
            Icons.analytics,
            Colors.green,
            'sociological',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon, Color color, String category) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        leading: Icon(icon, color: color, size: 32),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PollListScreen(category: category),
            ),
          );
        },
      ),
    );
  }
}