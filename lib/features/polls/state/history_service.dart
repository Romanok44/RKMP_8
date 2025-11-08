import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/poll_result.dart';

class HistoryService with ChangeNotifier {
  static const String _storageKey = 'poll_results';
  List<PollResult> _results = [];

  List<PollResult> get results => _results;

  HistoryService() {
    _loadResults();
  }

  Future<void> _loadResults() async {
    final prefs = await SharedPreferences.getInstance();
    final String? resultsString = prefs.getString(_storageKey);

    if (resultsString != null) {
      final List<dynamic> resultsList = json.decode(resultsString);
      _results = resultsList.map((item) => PollResult.fromJson(item)).toList();
      notifyListeners();
    }
  }

  Future<void> addResult(PollResult result) async {
    _results.insert(0, result);
    await _saveResults();
    notifyListeners();
  }

  Future<void> _saveResults() async {
    final prefs = await SharedPreferences.getInstance();
    final String resultsString = json.encode(
      _results.map((result) => result.toJson()).toList(),
    );
    await prefs.setString(_storageKey, resultsString);
  }

  Future<void> clearHistory() async {
    _results.clear();
    await _saveResults();
    notifyListeners();
  }

  Future<void> updateResult(String id, int rating, String review) async {
    final index = _results.indexWhere((result) => result.id == id);
    if (index != -1) {
      _results[index] = _results[index].copyWith(
        rating: rating,
        review: review,
      );
      await _saveResults();
      notifyListeners();
    }
  }
}