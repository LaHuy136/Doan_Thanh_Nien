import 'package:flutter_bloc/flutter_bloc.dart';
import 'event/profile_event.dart';
import 'state/profle_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<LoadProfile>((event, emit) {
      emit(ProfileState(
        name: event.name,
        gender: event.gender,
        dateOfBirth: event.dateOfBirth,
        faculty: event.faculty,
        studentId: event.studentId,
      ));
    });
  }
}
