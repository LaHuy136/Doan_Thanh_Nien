import 'package:flutter/material.dart';

class MySubTextfield extends StatelessWidget {
  final String text;
  const MySubTextfield({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Color.fromARGB(255, 40, 17, 187),
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}
