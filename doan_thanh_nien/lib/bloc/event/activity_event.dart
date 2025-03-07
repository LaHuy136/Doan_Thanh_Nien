import 'package:equatable/equatable.dart';

import '../../models/volunteer_activities.dart';

class ActivityDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadActivityDetail extends ActivityDetailEvent {
  final String title;
  final String imagePath;
  final String day;
  final String location;
  final int? registered;

  LoadActivityDetail({
    required this.title,
    required this.imagePath,
    required this.day,
    required this.location,
    this.registered,
  });

  @override
  List<Object?> get props => [title, imagePath, day, location, registered];
}

class RegisterActivity extends ActivityDetailEvent {
  final volunteerActivities event;

  RegisterActivity({required this.event});
}
