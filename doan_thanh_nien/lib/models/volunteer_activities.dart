// ignore_for_file: camel_case_types

class volunteerActivities {
  final String imagePath;
  final String title;
  final String day;
  final String location;
  final bool? isRegistered;
  final volunteerActivitiesCategory? category;

  volunteerActivities({
    required this.imagePath,
    required this.title,
    required this.day,
    required this.location,
    this.category,
    this.isRegistered,
  });
  @override
  String toString() {
    return 'Title: $title, Day: $day, Location: $location, Category: $category';
  }
}

// volunteerActivites categories
enum volunteerActivitiesCategory {
  traditional,
  research,
  union,
  another,
}
