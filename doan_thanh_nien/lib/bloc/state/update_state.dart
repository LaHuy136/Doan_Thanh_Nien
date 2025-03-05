sealed class UpdateState {}

class UpdateInitial extends UpdateState {}

class UpdateLoaded extends UpdateState {
  final String name;
  final String gender;
  final String dateOfBirth;
  final String faculty;
  final String studentId;

  UpdateLoaded({
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.faculty,
    required this.studentId,
  });
}

class UpdateSuccess extends UpdateState {}
