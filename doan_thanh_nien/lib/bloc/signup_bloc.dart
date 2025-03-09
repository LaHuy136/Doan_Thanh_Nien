// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helpers/save_user_profile.dart';
import 'event/signup_event.dart';
import 'state/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  String name = '';
  String password = '';
  String gender = '';
  String dateOfBirth = '';
  String faculty = '';
  String studentId = '';
  BuildContext context;
  SignUpBloc(this.context) : super(SignUpInitial()) {
    on<NameChanged>((event, emit) {
      name = event.name;
    });
    on<PasswordChanged>((event, emit) {
      name = event.password;
    });
    on<GenderChanged>((event, emit) {
      gender = event.gender;
    });
    on<DateOfBirthChanged>((event, emit) {
      dateOfBirth = event.dateOfBirth;
    });
    on<FacultyChanged>((event, emit) {
      faculty = event.faculty;
    });
    on<StudentIdChanged>((event, emit) {
      studentId = event.studentId;
    });

    on<SignUpSubmitted>((event, emit) async {
      if (event.name.isEmpty ||
          event.password.isEmpty ||
          event.gender.isEmpty ||
          event.dateOfBirth.isEmpty ||
          event.faculty.isEmpty ||
          event.studentId.isEmpty) {
        emit(SignUpFailure());
        emit(SignUpInitial());
        return;
      }
      if (event.password.length < 6) {
        emit(SignUpFailure());
        emit(SignUpInitial());

        return;
      }
      if (!RegExp(r'^10221\d{4}$').hasMatch(event.studentId)) {
        emit(SignUpFailure());
        emit(SignUpInitial());
        return;
      }

      emit(SignUpLoading());
      try {
        await saveUserProfile(
          name: event.name,
          password: event.password,
          gender: event.gender,
          dateOfBirth: event.dateOfBirth,
          faculty: event.faculty,
          studentId: event.studentId,
        );

        emit(SignUpSuccess());
      } catch (_) {
        emit(SignUpFailure());
        emit(SignUpInitial());
      }
    });
  }
}
