import 'package:equatable/equatable.dart';

abstract class UpdateEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateUserDataEvent extends UpdateEvent {
  final String name;
  final String gender;
  final String dateOfBirth;
  final String faculty;
  final String studentId;

  UpdateUserDataEvent({
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.faculty,
    required this.studentId,
  });

  @override
  List<Object> get props => [name, gender, dateOfBirth, faculty, studentId];
}
