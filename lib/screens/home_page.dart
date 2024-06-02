import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/topic_provider.dart';
import '../widgets/question_list.dart';
import '../widgets/toggle_questions_button.dart';
import '../widgets/floating_action_buttons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: UnderlineTabIndicator(
            borderSide:
                BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
          ),
          tabs: const [
            Tab(text: "Month/Day"),
            Tab(text: "Random"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20), // 여백 추가
            const Text("My topic for today is..."),
            const SizedBox(height: 10),
            Consumer<TopicProvider>(
              builder: (context, topicProvider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100, // 고정 높이
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1), // 아주 연한 배경색
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            topicProvider.currentTopic.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 24), // 폰트 크기 증가
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${topicProvider.currentTopic.month} Day${topicProvider.currentTopic.day}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Colors.blueGrey
                                        .withOpacity(0.7)), // 폰트 색상 더 연하게
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Divider(color: Theme.of(context).dividerColor),
                    const SizedBox(height: 10),
                    const ToggleQuestionsButton(),
                    const SizedBox(height: 20),
                    if (topicProvider.showQuestions)
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1), // 아주 연한 배경색
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: QuestionList(
                            questions: topicProvider.currentTopic.questions),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: buildFloatingActionButton(context, _tabController),
    );
  }
}
