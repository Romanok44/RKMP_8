import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../widgets/rating_review_screen.dart';

class DigitalHabitsResultScreen extends StatelessWidget {
  const DigitalHabitsResultScreen({super.key});

  void _navigateToRatingReview(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RatingReviewScreen(
          pollId: 'digital_habits',
          pollTitle: 'Опрос о цифровых привычках',
          pollCategory: 'Социологические опросы',
          pollResult: 'Цифровой энтузиаст',
          onComplete: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Результат"),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Спасибо за участие!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CachedNetworkImage(
                imageUrl: 'https://avatars.dzeninfra.ru/get-zen_doc/1590219/pub_5fbf3b42d81aaf181bffb36c_5fbf422f6ea65c24b339c7ec/scale_1200',
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              const Text(
                "Ваш профиль: Цифровой энтузиаст",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              const Text(
                "Вы активно используете технологии в повседневной жизни, следите за новинками и легко адаптируетесь к цифровым изменениям. Ваши привычки показывают высокий уровень цифровой грамотности.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => _navigateToRatingReview(context),
                  child: const Text(
                    "Оценить опрос",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(
                    "Завершить без оценки",
                    style: TextStyle(fontSize: 16),
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