import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'event/profile_event.dart';
import 'state/profle_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  Future<void> _onLoadProfile(
      LoadProfile event, Emitter<ProfileState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name') ?? '';
    String gender = prefs.getString('gender') ?? '';
    String dateOfBirth = prefs.getString('dateOfBirth') ?? '';
    String faculty = prefs.getString('faculty') ?? '';
    String studentId = prefs.getString('studentId') ?? '';

    emit(state.copyWith(
      name: name,
      gender: gender,
      dateOfBirth: dateOfBirth,
      faculty: faculty,
      studentId: studentId,
    ));
  }

  Future<void> _onUpdateProfile(
      UpdateProfile event, Emitter<ProfileState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (event.dateOfBirth != null) {
      await prefs.setString('dateOfBirth', event.dateOfBirth!);
    }

    emit(state.copyWith(
      name: event.name ?? state.name,
      gender: event.gender ?? state.gender,
      dateOfBirth: event.dateOfBirth ?? state.dateOfBirth,
      faculty: event.faculty ?? state.faculty,
      studentId: event.studentId ?? state.studentId,
    ));
  }
}
