import 'package:flutter/material.dart';

class TopHeaderText extends StatelessWidget {
  final String title;
  final String body;

  const TopHeaderText({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextTheme.of(context).titleLarge),
        const SizedBox(height: 5),
        Text(
          body,
          style: TextTheme.of(context).titleSmall,
        ),
      ],
    );
  }
}