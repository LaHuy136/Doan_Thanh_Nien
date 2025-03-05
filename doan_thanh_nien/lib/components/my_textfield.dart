// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final Function(dynamic)? onChanged;
  final TextEditingController? controller;

  const MyTextfield({
    super.key,
    required this.hintText,
    required this.obsecureText,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromARGB(255, 245, 245, 250),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 245, 245, 250),
              ),
              borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 250, 250, 255),
              ),
              borderRadius: BorderRadius.circular(8.0)),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Poppins-Medium',
            fontSize: 16,
            color: Color.fromARGB(184, 156, 168, 211),
            letterSpacing: 0.7,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        ),
      ),
    );
  }
}
