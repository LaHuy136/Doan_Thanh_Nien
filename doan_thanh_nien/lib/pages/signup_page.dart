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
  String name = '';
  String password = '';
  String gender = '';
  String dateOfBirth = '';
  String faculty = '';
  String studentId = '';

  @override
  Widget build(BuildContext context) {
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
                          onChanged: (value) => setState(() {
                            name = value;
                          }),
                          hintText: 'Nguyễn Văn A',
                          obsecureText: false,
                        ),
                        const SizedBox(height: 20),
                        const MySubTextfield(text: 'Mật khẩu'),
                        const SizedBox(height: 15),
                        MyTextfield(
                          onChanged: (value) => setState(() {
                            name = value;
                          }),
                          hintText: '******',
                          obsecureText: true,
                        ),
                        const SizedBox(height: 20),
                        const MySubTextfield(text: 'Giới tính'),
                        const SizedBox(height: 15),
                        MyTextfield(
                          onChanged: (value) => setState(() {
                            gender = value;
                          }),
                          hintText: 'Nam / Nữ',
                          obsecureText: false,
                        ),
                        const SizedBox(height: 20),
                        const MySubTextfield(text: 'Ngày sinh'),
                        const SizedBox(height: 15),
                        MyTextfield(
                          onChanged: (value) => setState(() {
                            dateOfBirth = value;
                          }),
                          hintText: 'Ngày / Tháng / Năm',
                          obsecureText: false,
                        ),
                        const SizedBox(height: 20),
                        const MySubTextfield(text: 'Khoa - Lớp'),
                        const SizedBox(height: 15),
                        MyTextfield(
                          onChanged: (value) => setState(() {
                            faculty = value;
                          }),
                          hintText: 'Công nghệ thông tin - K21',
                          obsecureText: false,
                        ),
                        const SizedBox(height: 20),
                        const MySubTextfield(text: 'Mã sinh viên'),
                        const SizedBox(height: 15),
                        MyTextfield(
                          onChanged: (value) => setState(() {
                            studentId = value;
                          }),
                          hintText: '102210xxxxx',
                          obsecureText: false,
                        ),
                        const SizedBox(height: 20),
                        MyButton(
                          onTap: () {
                            context.read<SignUpBloc>().add(SignUpSubmitted(
                                  name: name,
                                  password: password,
                                  gender: gender,
                                  dateOfBirth: dateOfBirth,
                                  faculty: faculty,
                                  studentId: studentId,
                                ));
                          },
                          text: state is SignUpLoading
                              ? 'Đang tạo tài khoản...'
                              : state is SignUpFailure
                                  ? 'Lỗi! Thử lại.'
                                  : 'Tạo tài khoản', // Hiển thị trạng thái khác nếu không phải loading hay failure
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
