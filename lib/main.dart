import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'providers/topic_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TopicProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PSE',
      theme: _buildThemeData(),
      home: const MyHomePage(title: 'PSE'),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      materialTapTargetSize: MaterialTapTargetSize.padded,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      fontFamily: 'Pretendard',
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.grey,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          textStyle: const MaterialStatePropertyAll(
              TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 20)),
          backgroundColor: MaterialStateProperty.all(Colors.black),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
