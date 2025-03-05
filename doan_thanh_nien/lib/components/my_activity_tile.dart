import 'package:doan_thanh_nien/models/volunteer_activities.dart';
import 'package:flutter/material.dart';

class MyActivityTile extends StatelessWidget {
  final volunteerActivities activity;
  final VoidCallback onTap;
  const MyActivityTile(
      {super.key, required this.onTap, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title image
            Image.asset(
              activity.imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            // title
            Text(
              activity.title,
              style: const TextStyle(
                color: Color.fromARGB(255, 46, 46, 93),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins-Medium',
              ),
            ),

            const SizedBox(height: 4),

            // date
            Row(
              children: [
                const Icon(
                  Icons.date_range_outlined,
                  color: Color.fromARGB(255, 0, 80, 157),
                ),
                const SizedBox(width: 4),
                Text(
                  activity.day,
                  style: const TextStyle(
                    letterSpacing: 0.4,
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 80, 157),
                    fontFamily: 'Roboto-Regular',
                  ),
                ),
              ],
            ),

            // location
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Color.fromARGB(255, 0, 80, 157),
                ),
                Text(
                  activity.location,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 80, 157),
                    fontFamily: 'Roboto-Regular',
                  ),
                ),

                // details button
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: const Color.fromARGB(255, 0, 80, 157),
                    ),
                    child: IconButton(
                      onPressed: onTap,
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
