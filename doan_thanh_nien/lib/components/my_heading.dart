import 'package:flutter/material.dart';

class MyHeading extends StatelessWidget {
  final String text;
  const MyHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
            color: Color.fromARGB(255, 21, 61, 133),
            fontFamily: 'Poppins-SemiBold',
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
