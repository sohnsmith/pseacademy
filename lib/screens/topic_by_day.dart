import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/topic_provider.dart';
import '../widgets/question_list.dart';
import '../widgets/toggle_questions_button.dart';

class TopicByDay extends StatelessWidget {
  const TopicByDay({super.key});

  @override
  Widget build(BuildContext context) {
    final topicProvider = Provider.of<TopicProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("My topic for today is..."),
            const SizedBox(height: 10),
            Text(
              topicProvider.currentTopic.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${topicProvider.currentTopic.month} Day${topicProvider.currentTopic.day}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10),
            const ToggleQuestionsButton(),
            const SizedBox(height: 20),
            if (topicProvider.showQuestions)
              QuestionList(questions: topicProvider.currentTopic.questions),
          ],
        ),
      ),
    );
  }
}
