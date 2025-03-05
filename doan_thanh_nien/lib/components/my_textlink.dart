import 'package:flutter/material.dart';

class MyTextlink extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const MyTextlink({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto-SemiBold',
              fontSize: 14,
              color: Color.fromARGB(255, 21, 61, 133),
            ),
          ),
        ),
      ),
    );
  }
}
