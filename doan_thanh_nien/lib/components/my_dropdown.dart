// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function(String) onSelect;
  const MyDropdown({
    super.key,
    required this.text,
    required this.icon,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color.fromARGB(255, 40, 117, 187),
          size: 25,
        ),
        title: Text(
          text,
          style: const TextStyle(
            color: Color.fromARGB(255, 40, 117, 187),
          ),
        ),
        onTap: () {
          showMenu<String>(
            context: context,
            position: RelativeRect.fromLTRB(0, 370, 0, 0),
            items: <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'works',
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.minimize,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Hoạt động tình nguyện lao động',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'gifts',
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.minimize,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Hoạt động tình nguyện hiến tặng',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'supports',
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.minimize,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Hoạt động tình nguyện hỗ trợ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'another',
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.minimize,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Hoạt động khác',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            color: Color.fromARGB(255, 21, 61, 133),
            popUpAnimationStyle: AnimationStyle(
              curve: Curves.ease,
              duration: Durations.extralong1,
              reverseCurve: Curves.easeIn,
              reverseDuration: Durations.long3,
            ),
          ).then((value) {
            if (value != null) {
              onSelect(value);
            }
          });
        },
      ),
    );
  }
}
