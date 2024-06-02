import 'dart:math';
import 'package:flutter/material.dart';
import '../models/topic.dart';
import '../data/topics.dart';

class TopicProvider with ChangeNotifier {
  int _randomNumber = 0;
  bool _showQuestions = false;
  String _selectedMonth = "BM1";
  int _selectedDay = 1;

  int get randomNumber => _randomNumber;
  bool get showQuestions => _showQuestions;
  String get selectedMonth => _selectedMonth;
  int get selectedDay => _selectedDay;

  Topic get currentTopic {
    return topics[_randomNumber];
  }

  List<Topic> get filteredTopics {
    return topics
        .where((topic) =>
            topic.month == _selectedMonth && topic.day == _selectedDay)
        .toList();
  }

  void incrementCounter() {
    _randomNumber = Random().nextInt(topics.length);
    _showQuestions = false;
    notifyListeners();
  }

  void toggleQuestions() {
    _showQuestions = !_showQuestions;
    notifyListeners();
  }

  void setSelectedMonth(String month) {
    _selectedMonth = month;
    _updateFilteredTopic();
  }

  void setSelectedDay(int day) {
    _selectedDay = day;
    _updateFilteredTopic();
  }

  void _updateFilteredTopic() {
    final filtered = filteredTopics;
    if (filtered.isNotEmpty) {
      _randomNumber = topics.indexOf(filtered[0]);
    }
    notifyListeners();
  }
}
