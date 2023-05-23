import 'package:flutter/material.dart';
import 'package:quizzler/start_screen.dart';
import 'package:quizzler/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late Widget activeScreen;
  var screen = "startscreen";

  void switchScreen() {
    setState(() {
      screen = "questionscreen";
    });
  }

  void startAgain() {
    setState(() {
      screen = "startscreen";
    });
  }

  @override
  Widget build(BuildContext context) {
    if (screen == "startscreen") {
      setState(() {
        activeScreen = StartScreen(switchScreen, startAgain);
      });
    } else if (screen == "questionscreen") {
      setState(() {
        activeScreen = QuestionScreen(startAgain);
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 46, 4, 65),
              Color.fromARGB(255, 70, 4, 100)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
