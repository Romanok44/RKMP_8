import 'package:flutter/material.dart';
import 'features/polls/screens/start_screen.dart';
import 'shared/app_theme.dart';
import 'shared/app_state.dart';

class PollApp extends StatefulWidget {
  const PollApp({super.key});

  @override
  State<PollApp> createState() => _PollAppState();
}

class _PollAppState extends State<PollApp> {
  int _completedPollsCount = 0;
  ThemeData _themeData = AppTheme.themeData;

  void _incrementCompletedPollsCount() {
    setState(() {
      _completedPollsCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppState(
      completedPollsCount: _completedPollsCount,
      themeData: _themeData,
      incrementCompletedPollsCount: _incrementCompletedPollsCount,
      child: MaterialApp(
        title: 'Poll Tracker',
        theme: _themeData,
        home: const StartScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}