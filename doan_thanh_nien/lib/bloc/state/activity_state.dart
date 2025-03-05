sealed class ActivityDetailState {}

class ActivityDetailInitial extends ActivityDetailState {}

class ActivityDetailLoaded extends ActivityDetailState {
  final String title;
  final String imagePath;
  final String day;
  final String location;
  final int registered;

  ActivityDetailLoaded({
    required this.title,
    required this.imagePath,
    required this.day,
    required this.location,
    required this.registered,
  });
}