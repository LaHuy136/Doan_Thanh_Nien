sealed class UpdateEvent {}

class LoadUserDataEvent extends UpdateEvent {}

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
}
