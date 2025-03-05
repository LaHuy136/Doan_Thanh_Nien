// ignore_for_file: use_build_context_synchronously

import 'package:doan_thanh_nien/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/event/login_event.dart';
import '../bloc/login_bloc.dart';
import '../components/my_button.dart';
import '../components/my_textlink.dart';
import 'signup_page.dart';

// Login Page
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/logo.jpg', width: 242, height: 250),
                const SizedBox(height: 25),
                
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return MyTextfield(
                      hintText: 'Mã sinh viên',
                      obsecureText: false,
                      onChanged: (value) => context
                          .read<LoginBloc>()
                          .add(StudentIDChanged(value)),
                    );
                  },
                ),


                const SizedBox(height: 15),


                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return MyTextfield(
                      hintText: 'Mật khẩu',
                      obsecureText: true,
                      onChanged: (value) => context.read<LoginBloc>().add(
                            PasswordChanged(value),
                          ),
                    );
                  },
                ),
                const SizedBox(height: 25),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return MyButton(
                      onTap: state.isLoading
                          ? null
                          : () =>
                              context.read<LoginBloc>().add(LoginSubmitted()),
                      text: state.isLoading ? 'Đang xử lý...' : 'Đăng nhập',
                    );
                  },
                ),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state.errorMessage != null) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Lỗi đăng nhập'),
                          content: Text(state.errorMessage!),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Container(),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextlink(
                        onTap: () {},
                        text: 'Quên mật khẩu',
                      ),
                      const SizedBox(width: 15),
                      MyTextlink(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp())),
                        text: 'Tạo tài khoản',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
