import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'result_screen.dart';

class MemeTestStartScreen extends StatelessWidget {
  const MemeTestStartScreen({super.key});

  void _startTest(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MemeTestResultScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Тест на знание мемов"),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: 'https://avatars.mds.yandex.net/get-games/1892995/2a000001815c30e1fce072fcb2fc693ffcde/default526x314',
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Text(
                "Тест на знание мемов",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                "Проверь, насколько ты в теме интернет-культуры!",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => _startTest(context),
                  child: const Text(
                    "Начать тест",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}