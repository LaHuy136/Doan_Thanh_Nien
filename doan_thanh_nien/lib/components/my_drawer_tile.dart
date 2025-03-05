import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final Function()? onTap;
  final Function(String)? onSelect;
  final String text;
  final IconData icon;
  const MyDrawerTile({
    super.key,
    required this.text,
    this.onTap,
    required this.icon,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: ListTile(
        title: Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 40, 117, 187),
          ),
        ),
        leading: Icon(
          icon,
          color: const Color.fromARGB(255, 40, 117, 187),
          size: 25,
        ),
        onTap: onTap,
      ),
    );
  }
}
