import 'package:flutter/material.dart';

class AppState extends InheritedWidget {
  final int completedPollsCount;
  final ThemeData themeData;
  final VoidCallback incrementCompletedPollsCount;

  const AppState({
    super.key,
    required super.child,
    required this.completedPollsCount,
    required this.themeData,
    required this.incrementCompletedPollsCount,
  });

  static AppState of(BuildContext context) {
    final AppState? result = context.dependOnInheritedWidgetOfExactType<AppState>();
    assert(result != null, 'No AppState found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return completedPollsCount != oldWidget.completedPollsCount ||
        themeData != oldWidget.themeData;
  }
}