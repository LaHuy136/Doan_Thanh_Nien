// Login event
// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import 'event/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Login State
class LoginState {
  final String studentID;
  final String password;
  final bool isLoading;
  final String? errorMessage;

  LoginState({
    this.studentID = '',
    this.password = '',
    this.isLoading = false,
    this.errorMessage,
  });

  LoginState copyWith({
    String? studentID,
    String? password,
    bool? isLoading,
    String? errorMessage,
  }) {
    return LoginState(
      studentID: studentID ?? this.studentID,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final BuildContext context;
  LoginBloc(this.context) : super(LoginState()) {
    on<StudentIDChanged>((event, emit) {
      emit(state.copyWith(studentID: event.studentID));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String storedStudentID = prefs.getString('studentId') ?? '';

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(selectedCategory: 'All'),
          ));
      // if (state.studentID == '102210255' && state.password == 'admin123') {
      //   // Đăng nhập thành công, chuyển sang trang HomePage
      //   emit(state.copyWith(isLoading: false));
      //   );
      // } else {
      //   // Đăng nhập thất bại
      //   emit(state.copyWith(
      //       isLoading: false,
      //       errorMessage: 'Mã sinh viên hoặc mật khẩu không chính xác!'));
      // }
    });
  }
}
