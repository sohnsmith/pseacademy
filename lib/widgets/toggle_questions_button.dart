import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/topic_provider.dart';

class ToggleQuestionsButton extends StatelessWidget {
  const ToggleQuestionsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topicProvider = Provider.of<TopicProvider>(context);

    return ElevatedButton.icon(
      icon: Icon(
        topicProvider.showQuestions
            ? Icons.question_answer_outlined
            : Icons.question_answer,
      ),
      label: Text(
        topicProvider.showQuestions ? 'Hide Questions' : 'Show Questions',
      ),
      onPressed: topicProvider.toggleQuestions,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}
