import 'package:equatable/equatable.dart';

class ActivityDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadActivityDetail extends ActivityDetailEvent {
  final String title;
  final String imagePath;
  final String day;
  final String location;
  final int registered;

  LoadActivityDetail({
    required this.title,
    required this.imagePath,
    required this.day,
    required this.location,
    required this.registered,
  });

  @override
  List<Object?> get props => [title, imagePath, day, location, registered];
}
