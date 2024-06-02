import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/topic_provider.dart';

class ToggleQuestionsButton extends StatelessWidget {
  const ToggleQuestionsButton({super.key}); // super.key 사용

  @override
  Widget build(BuildContext context) {
    final topicProvider = Provider.of<TopicProvider>(context);
    return ElevatedButton(
      onPressed: topicProvider.toggleQuestions,
      child: Text(
          topicProvider.showQuestions ? 'Hide Questions' : 'Show Questions'),
    );
  }
}
