import 'package:flutter/material.dart';

class SummaryBox extends StatelessWidget {
  const SummaryBox(this.summary, {super.key});
  final Map<String, Object> summary;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor:
              summary["color"] as bool ? Colors.greenAccent : Colors.redAccent,
          child: Text(
            summary["questionIndex"] as String,
            style: const TextStyle(
              color: Color.fromARGB(255, 35, 34, 34),
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (summary["question"] as String),
                style: const TextStyle(
                  color: Color.fromARGB(255, 198, 206, 206),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                summary["answer"] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 93, 222, 88),
                  fontSize: 14,
                ),
              ),
              Text(
                summary["selected"] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 149, 185, 199),
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
