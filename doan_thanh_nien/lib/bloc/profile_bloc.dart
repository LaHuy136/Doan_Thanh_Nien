import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'event/profile_event.dart';
import 'state/profle_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<LoadProfile>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String name = prefs.getString('name') ?? '';
      String gender = prefs.getString('gender') ?? '';
      String dateOfBirth = prefs.getString('dateOfBirth') ?? '';
      String faculty = prefs.getString('faculty') ?? '';
      String studentId = prefs.getString('studentId') ?? '';

      emit(ProfileState(
        name: name,
        gender: gender,
        dateOfBirth: dateOfBirth,
        faculty: faculty,
        studentId: studentId,
      ));
    });
  }
}
