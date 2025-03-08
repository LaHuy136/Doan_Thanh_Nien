// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doan_thanh_nien/components/my_button.dart';
import 'package:doan_thanh_nien/components/my_sub_textfield.dart';
import 'package:doan_thanh_nien/components/my_textfield.dart';
import '../bloc/event/signup_event.dart';
import '../bloc/state/signup_state.dart';
import '../components/my_heading.dart';
import '../bloc/signup_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    final genderController = TextEditingController();
    final dateOfBirthController = TextEditingController();
    final facultyController = TextEditingController();
    final studentIdController = TextEditingController();

    return BlocProvider(
      create: (context) => SignUpBloc(context),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const MyHeading(text: 'Tạo tài khoản'),
                const SizedBox(height: 50),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MySubTextfield(text: 'Họ và tên'),
                        const SizedBox(height: 15),
                        MyTextfield(
                          controller: nameController,
                          onChanged: (value) {
                            context.read<SignUpBloc>().add(NameChanged(value));
                          },
                          hintText: 'Nguyễn Văn A',
                          obsecureText: false,
                        ),
                        const SizedBox(height: 20),
                        const MySubTextfield(text: 'Mật khẩu'),
                        const SizedBox(height: 15),
                        MyTextfield(
                          controller: passwordController,
                          onChanged: (value) {
                            context
                                .read<SignUpBloc>()
                                .add(PasswordChanged(value));
                          },
                          hintText: '******',
                          obsecureText: true,
                        ),
                        const SizedBox(height: 20),
                        const MySubTextfield(text: 'Giới tính'),
                        const SizedBox(height: 15),
                        MyTextfield(
                          controller: genderController,
                          onChanged: (value) {
                            context
                                .read<SignUpBloc>()
                                .add(GenderChanged(value));
                          },
                          hintText: 'Nam / Nữ',
                          obsecureText: false,
                        ),
                        const SizedBox(height: 20),
                        const MySubTextfield(text: 'Ngày sinh'),
                        const SizedBox(height: 15),
                        MyTextfield(
                          controller: dateOfBirthController,
                          onChanged: (value) {
                            context
                                .read<SignUpBloc>()
                                .add(DateOfBirthChanged(value));
                          },
                          hintText: 'Ngày / Tháng / Năm',
                          obsecureText: false,
                        ),
                        const SizedBox(height: 20),
                        const MySubTextfield(text: 'Khoa - Lớp'),
                        const SizedBox(height: 15),
                        MyTextfield(
                          controller: facultyController,
                          onChanged: (value) {
                            context
                                .read<SignUpBloc>()
                                .add(FacultyChanged(value));
                          },
                          hintText: 'Công nghệ thông tin - K21',
                          obsecureText: false,
                        ),
                        const SizedBox(height: 20),
                        const MySubTextfield(text: 'Mã sinh viên'),
                        const SizedBox(height: 15),
                        MyTextfield(
                          controller: studentIdController,
                          onChanged: (value) {
                            context
                                .read<SignUpBloc>()
                                .add(StudentIdChanged(value));
                          },
                          hintText: '102210xxxxx',
                          obsecureText: false,
                        ),
                        const SizedBox(height: 20),
                        MyButton(
                          onTap: () {
                            context.read<SignUpBloc>().add(SignUpSubmitted(
                                  name: nameController.text,
                                  password: passwordController.text,
                                  gender: genderController.text,
                                  dateOfBirth: dateOfBirthController.text,
                                  faculty: facultyController.text,
                                  studentId: studentIdController.text,
                                ));
                          },
                          text: state is SignUpLoading
                              ? 'Đang tạo tài khoản...'
                              : state is SignUpFailure
                                  ? 'Lỗi! Thử lại.'
                                  : 'Tạo tài khoản', 
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
