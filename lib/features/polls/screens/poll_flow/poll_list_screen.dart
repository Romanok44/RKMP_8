import 'package:flutter/material.dart';
import '../polls/kitten_poll/start_screen.dart' as kitten_poll;
import '../polls/meme_test/start_screen.dart' as meme_test;
import '../polls/personality_test/start_screen.dart' as personality_test;
import '../polls/digital_habits/start_screen.dart' as digital_habits;

class PollListScreen extends StatelessWidget {
  final String category;
  const PollListScreen({super.key, required this.category});

  List<Map<String, dynamic>> _getPolls() {
    switch (category) {
      case 'funny':
        return [
          {
            'title': 'Какой ты сегодня котенок?',
            'description': 'Узнай, какой ты пушистик сегодня',
            'screen': const kitten_poll.StartScreen(),
          },
          {
            'title': 'Тест на знание мемов',
            'description': 'Проверь, насколько ты в теме интернет-культуры',
            'screen': const meme_test.MemeTestStartScreen(),
          },
          {
            'title': 'Какой бутерброд определяет твою жизнь?',
            'description': 'От классического до экстравагантного - найди свой бутерброд-судьбу',
          },
          {
            'title': 'Как хорошо ты знаешь аниме "Наруто"?',
            'description': 'Проверь свои знания о Наруто, Саске и Конохе',
          },
          {
            'title': 'Какой ты супергерой?',
            'description': 'Определи свои суперспособности и стиль героизма',
          },
          {
            'title': 'Сколько бы ты сумел выжить в постапокалиптическом мире?',
            'description': 'Пройди тест и узнай, насколько ты подготовлен к зомби-апокалипсису',
          },
        ];
      case 'personality':
        return [
          {
            'title': 'Тест на тип личности',
            'description': 'Узнай свой психологический тип',
            'screen': const personality_test.PersonalityTestStartScreen(),
          },
          {
            'title': 'Тест Майерс-Бриггс',
            'description': 'Определи свой тип личности из 16 возможных вариантов',
          },
          {
            'title': 'Тест на профориентацию',
            'description': 'Найди профессию, которая подходит именно тебе',
          },
          {
            'title': 'Тест на эмоциональный интеллект',
            'description': 'Оцени свою способность понимать и управлять эмоциями',
          },
          {
            'title': 'Тест на уровень стресса',
            'description': 'Узнай, насколько стресс влияет на твою жизнь',
          },
        ];
      case 'sociological':
        return [
          {
            'title': 'Опрос о цифровых привычках',
            'description': 'Исследование использования технологий',
            'screen': const digital_habits.DigitalHabitsStartScreen(),
          },
          {
            'title': 'Удовлетворенность смартфонами Apple',
            'description': 'Помоги улучшить продукты Apple, поделись своим опытом',
          },
          {
            'title': 'Опрос о качестве обслуживания в магазине "Пятерочка"',
            'description': 'Оцени уровень сервиса в популярной продуктовой сети',
          },
          {
            'title': 'Исследование предпочтений в выборе досуга',
            'description': 'Расскажи, как ты предпочитаешь проводить свободное время',
          },
          {
            'title': 'Опрос о привычках потребления кофе',
            'description': 'Исследуем кофейные традиции и предпочтения',
          },
          {
            'title': 'Исследование о влиянии социальных сетей',
            'description': 'Узнай, как соцсети влияют на твое настроение и поведение',
          },
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final polls = _getPolls();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Доступные опросы'),
        backgroundColor: Colors.blue[700],
      ),
      body: ListView.builder(
        itemCount: polls.length,
        itemBuilder: (context, index) {
          final poll = polls[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                poll['title'],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(poll['description']),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                if (poll['screen'] != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => poll['screen']),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Этот опрос находится в разработке')),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}