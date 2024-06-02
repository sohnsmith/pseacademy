import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/topic_provider.dart';

Widget buildFloatingActionButton(
    BuildContext context, TabController tabController) {
  final topicProvider = Provider.of<TopicProvider>(context, listen: false);
  if (tabController.index == 0) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () => _selectMonth(context),
          tooltip: 'Select Month',
          child: const Icon(Icons.calendar_today),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: () => _selectDay(context),
          tooltip: 'Select Day',
          child: const Icon(Icons.date_range),
        ),
      ],
    );
  } else {
    return FloatingActionButton(
      onPressed: topicProvider.incrementCounter,
      tooltip: 'Random Topic',
      child: const Icon(Icons.cached),
    );
  }
}

void _selectMonth(BuildContext context) {
  final topicProvider = Provider.of<TopicProvider>(context, listen: false);
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: const Text('BM1'),
            onTap: () {
              topicProvider.setSelectedMonth('BM1');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('BM2'),
            onTap: () {
              topicProvider.setSelectedMonth('BM2');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('BM3'),
            onTap: () {
              topicProvider.setSelectedMonth('BM3');
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

void _selectDay(BuildContext context) {
  final topicProvider = Provider.of<TopicProvider>(context, listen: false);
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 300,
        child: ListView(
          children: List<Widget>.generate(20, (int index) {
            return ListTile(
              title: Text('Day ${index + 1}'),
              onTap: () {
                topicProvider.setSelectedDay(index + 1);
                Navigator.pop(context);
              },
            );
          }),
        ),
      );
    },
  );
}
