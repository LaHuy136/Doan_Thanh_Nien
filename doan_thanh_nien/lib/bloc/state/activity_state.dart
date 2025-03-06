import 'package:equatable/equatable.dart';

sealed class ActivityDetailState extends Equatable {}

class ActivityDetailInitial extends ActivityDetailState {
  @override
  List<Object?> get props => [];
}

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

  @override
  List<Object?> get props => [title, imagePath, day, location, registered];
}
