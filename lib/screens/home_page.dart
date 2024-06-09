import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/topic_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/question_list.dart';
import '../widgets/floating_action_buttons.dart';
import '../widgets/timer_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _elapsedTime = 0;

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

  void _updateElapsedTime(int time) {
    setState(() {
      _elapsedTime = time;
    });
  }

  String _formatTime(int milliseconds) {
    int minutes = (milliseconds ~/ 6000) % 60;
    int seconds = (milliseconds ~/ 100) % 60;
    int hundredths = milliseconds % 100;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${hundredths.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(
                themeProvider.isDarkMode ? Icons.wb_sunny : Icons.nights_stay),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20), // 여백 추가
                Text(
                  "My topic for today is...",
                  style: TextStyle(
                    fontSize: 16, // 폰트 크기 줄이기
                    color: Colors.grey[600], // 폰트 컬러 연하게 변경
                  ),
                ),
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
                                    ?.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${topicProvider.currentTopic.month} Day${topicProvider.currentTopic.day}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Colors.teal.withOpacity(0.7)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Divider(color: Theme.of(context).dividerColor),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: topicProvider.toggleQuestions,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Following Questions",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Icon(
                                topicProvider.showQuestions
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: Colors.grey[700],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        AnimatedCrossFade(
                          duration: const Duration(milliseconds: 300),
                          crossFadeState: topicProvider.showQuestions
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          firstChild: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1), // 아주 연한 배경색
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: QuestionList(
                                questions:
                                    topicProvider.currentTopic.questions),
                          ),
                          secondChild: Container(),
                        ),
                        if (_tabController.index == 1) ...[
                          const SizedBox(height: 20),
                          Text(
                            _formatTime(_elapsedTime),
                            style:
                                const TextStyle(fontSize: 40), // 폰트 크기를 40으로 증가
                          ),
                        ],
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _tabController.index == 1
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TimerButton(onTimeUpdate: _updateElapsedTime), // 타이머 버튼
                const SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () =>
                      Provider.of<TopicProvider>(context, listen: false)
                          .incrementCounter(),
                  tooltip: 'Random Topic',
                  child: const Icon(Icons.cached),
                ),
              ],
            )
          : buildFloatingActionButton(context, _tabController),
    );
  }
}
