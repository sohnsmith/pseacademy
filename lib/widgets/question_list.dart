import 'package:flutter/material.dart';

class QuestionList extends StatelessWidget {
  final List<String> questions;

  const QuestionList({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: questions.map((question) => Text(question)).toList(),
    );
  }
}
