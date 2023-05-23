import 'package:flutter/material.dart';
import 'package:quizzler/models/quiz_question.dart';
import 'package:quizzler/options_button.dart';
import 'package:quizzler/data/questions.dart';
import 'package:quizzler/summary_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.switchScreen, {super.key});
  final void Function() switchScreen;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var questionIndex = 0;
  final selectedAnswers = [];
  final List<Map<String, Object>> data = [];
  bool show = false;

  List<Map<String, Object>> getData() {
    for (var i = 0; i < questions.length; i++) {
      data.add({
        "questionIndex": "${i + 1}",
        "question": questions[i].question,
        "selected": selectedAnswers[i],
        "answer": questions[i].options[0],
        "color": selectedAnswers[i] == questions[i].options[0],
      });
    }
    return data;
  }

  void onSelect(String option) {
    selectedAnswers.add(option);

    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    late QuizQuestion currentQuestion;
    if (questionIndex < questions.length) {
      currentQuestion = questions[questionIndex];
    } else {
      show = true;
    }

    return show
        ? SummaryScreen(getData(), widget.switchScreen)
        : SizedBox(
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    currentQuestion.question,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ...currentQuestion.options.map((option) {
                    return OptionsButton(
                      onSelect: () {
                        onSelect(option);
                      },
                      text: option,
                    );
                  })
                ],
              ),
            ),
          );
  }
}
