import 'package:flutter/material.dart';
import 'dart:async';

class TimerButton extends StatefulWidget {
  final Function(int) onTimeUpdate;

  const TimerButton({super.key, required this.onTimeUpdate});

  @override
  _TimerButtonState createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  late Timer _timer;
  int _start = 0;
  bool _isRunning = false;

  void _startStopTimer() {
    if (_isRunning) {
      _timer.cancel();
    } else {
      _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {
          _start++;
        });
        widget.onTimeUpdate(_start);
      });
    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _startStopTimer,
      tooltip: _isRunning ? 'Stop Timer' : 'Start Timer',
      child: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
    );
  }
}
