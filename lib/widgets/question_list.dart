import 'package:flutter/material.dart';

class QuestionList extends StatelessWidget {
  final List<String> questions;

  const QuestionList({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: questions
            .map((question) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    question,
                    style: const TextStyle(fontSize: 16),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
