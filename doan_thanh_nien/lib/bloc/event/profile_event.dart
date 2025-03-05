import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {
  final String name;
  final String gender;
  final String dateOfBirth;
  final String faculty;
  final String studentId;

  LoadProfile({
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.faculty,
    required this.studentId,
  });

  @override
  List<Object?> get props => [name, gender, dateOfBirth, faculty, studentId];
}
