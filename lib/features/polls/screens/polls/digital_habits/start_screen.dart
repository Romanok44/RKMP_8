import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'result_screen.dart';

class DigitalHabitsStartScreen extends StatelessWidget {
  const DigitalHabitsStartScreen({super.key});

  void _startTest(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DigitalHabitsResultScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Опрос о цифровых привычках"),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: 'https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_6882268e0c886621f7bd31b7_6885d7ebde19fa09663cfc6e/scale_1200',
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Text(
                "Опрос о цифровых привычках",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                "Исследование использования технологий в повседневной жизни",
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
                    "Начать опрос",
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