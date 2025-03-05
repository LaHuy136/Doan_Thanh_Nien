// ignore_for_file: camel_case_types

class volunteerActivities {
  final String imagePath;
  final String title;
  final String day;
  final String location;
  final volunteerActivitiesCategory category;

  volunteerActivities({
    required this.imagePath,
    required this.title,
    required this.day,
    required this.location,
    required this.category,
  });
}

// volunteerActivites categories
enum volunteerActivitiesCategory {
  works,
  gifts,
  supports,
  another,
}
