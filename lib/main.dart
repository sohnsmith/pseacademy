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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title,style: const TextStyle(color: Colors.white),),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Today's Topic",
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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
