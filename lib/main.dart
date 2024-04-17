import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.white,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey,
            backgroundColor: Colors.white,
            brightness: Brightness.light),
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
      ),
      title: 'PSE',
      home: const MyHomePage(title: 'PSE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // bool _isHided = true;
  int _randomNumber = 0;
  String topic = "Random Topic";
  List<String> topicList = [
    "A cold",
    "Seasons",
    "Friends",
    "Studying",
    "Cell phones",
    "Movies",
    "Food",
    "Working out",
    "Coffee",
    "High school",
    "Drinking",
    "Cell-phone games",
    "Clothes",
    "Family",
    "The internet",
    "Vacation",
    "Celebrities",
    "School",
    "Pet peeves",
    "Relatives",
    "Favorite Holiday",
    "Least Favorite Holiday",
    "Goals",
    "Parents",
    "Siblings",
    "Books",
    "Presents",
    "Lunch",
    "Dramas",
    "American TV shows",
    "Sleep",
    "Part-Time Jobs",
    "Alcohol",
    "Social Networking Sites",
    "PSE",
    "Sports",
    "Hospital",
    "How long...",
    "Restaurants",
    "Retreat",
    "Christmas",
    "Fast food",
    "Pocket money",
    "Best friend",
    "College entrance exam",
    "Academy",
    "Sports",
    "English",
    "Naps",
    "Hair salons",
    "Pets",
    "Presents",
    "Hobbies",
    "Amusement Parks",
    "Ideal type",
    "Drinking games",
    "Music",
    "Certifications",
    "Arguments",
    "Personal hygiene"
  ];

  void _incrementCounter() {
    setState(() {
      _randomNumber = Random().nextInt(60);
      topic = topicList[_randomNumber];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "My topic for today is...",
            ),
            const SizedBox(height: 10),
            Text(
              topic,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            // IconButton(
            //   onPressed: () {
            //     setState(() {
            //       _isHided = !_isHided;
            //     });
            //   },
            //   icon: const Icon(Icons.question_mark_outlined),
            //   style: const ButtonStyle(
            //     iconColor: MaterialStatePropertyAll(Colors.white),
            //     backgroundColor: MaterialStatePropertyAll(Colors.black),
            //   ),
            // ),
            // Offstage(
            //   offstage: _isHided,
            //   child: const Column(
            //     children: [
            //       Text('Following Question1?'),
            //       Text('Following Question2?'),
            //       Text('Following Question3?'),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.cached),
      ),
    );
  }
}
