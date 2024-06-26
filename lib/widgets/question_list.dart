import 'package:flutter/material.dart';

class QuestionList extends StatelessWidget {
  final List<String> questions;

  const QuestionList({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: questions
          .map((question) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ",
                        style: TextStyle(fontSize: 16)), // 불릿 포인트 추가
                    Expanded(
                      child: Text(
                        question,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
