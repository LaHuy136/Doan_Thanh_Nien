import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final String name;
  final String gender;
  final String dateOfBirth;
  final String faculty;
  final String studentId;

  const ProfileState({
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.faculty,
    required this.studentId,
  });

  factory ProfileState.initial() {
    return const ProfileState(
      name: '',
      gender: '',
      dateOfBirth: '',
      faculty: '',
      studentId: '',
    );
  }

  ProfileState copyWith({
    String? name,
    String? gender,
    String? dateOfBirth,
    String? faculty,
    String? studentId,
  }) {
    return ProfileState(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      faculty: faculty ?? this.faculty,
      studentId: studentId ?? this.studentId,
    );
  }

  @override
  List<Object> get props => [name, gender, dateOfBirth, faculty, studentId];
}
