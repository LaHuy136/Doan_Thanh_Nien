import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'event/update_event.dart';
import 'state/update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateInitial()) {
    on<LoadUserDataEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      emit(UpdateLoaded(
        name: prefs.getString('name') ?? '',
        gender: prefs.getString('gender') ?? '',
        dateOfBirth: prefs.getString('dateOfBirth') ?? '',
        faculty: prefs.getString('faculty') ?? '',
        studentId: prefs.getString('studentId') ?? '',
      ));
    });

    on<UpdateUserDataEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', event.name);
      await prefs.setString('gender', event.gender);
      await prefs.setString('dateOfBirth', event.dateOfBirth);
      await prefs.setString('faculty', event.faculty);
      await prefs.setString('studentId', event.studentId);
      emit(UpdateSuccess());
    });
  }
}
