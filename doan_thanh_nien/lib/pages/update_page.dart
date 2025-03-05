import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/event/update_event.dart';
import '../bloc/state/update_state.dart';
import '../bloc/update_bloc.dart';
import '../components/my_button.dart';
import '../components/my_heading.dart';
import '../components/my_sub_textfield.dart';
import '../components/my_textfield.dart'; 

class UpdatePage extends StatelessWidget {
  final String name;
  final String gender;
  final String dateOfBirth;
  final String faculty;
  final String studentId;

  const UpdatePage({
    super.key,
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.faculty,
    required this.studentId,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: name);
    final genderController = TextEditingController(text: gender);
    final dateOfBirthController = TextEditingController(text: dateOfBirth);
    final facultyController = TextEditingController(text: faculty);
    final studentIDController = TextEditingController(text: studentId);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: BlocConsumer<UpdateBloc, UpdateState>(
            listener: (context, state) {
              if (state is UpdateSuccess) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (state is UpdateLoaded) {
                nameController.text = state.name;
                genderController.text = state.gender;
                dateOfBirthController.text = state.dateOfBirth;
                facultyController.text = state.faculty;
                studentIDController.text = state.studentId;
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),

                  const MyHeading(text: 'Cập nhật thông tin'),

                  const SizedBox(height: 50),

                  const MySubTextfield(text: 'Họ và tên'),

                  const SizedBox(height: 20),

                  MyTextfield(
                    controller: nameController,
                    hintText: 'Nguyễn Văn A',
                    obsecureText: false,
                  ),

                  const SizedBox(height: 20),

                  const MySubTextfield(text: 'Giới tính'),
                  
                  const SizedBox(height: 20),

                  MyTextfield(
                    controller: genderController,
                    hintText: 'Nam / Nữ',
                    obsecureText: false,
                  ),

                  const SizedBox(height: 20),

                  const MySubTextfield(text: 'Ngày sinh'),

                  const SizedBox(height: 20),
                  
                  MyTextfield(
                    controller: dateOfBirthController,
                    hintText: 'Ngày / Tháng / Năm',
                    obsecureText: false,

                  ),
                  const SizedBox(height: 20),

                  const MySubTextfield(text: 'Khoa - Lớp'),

                  const SizedBox(height: 20),

                  MyTextfield(
                    controller: facultyController,
                    hintText: 'Công nghệ thông tin - K21',
                    obsecureText: false,
                  ),

                  const SizedBox(height: 20),

                  const MySubTextfield(text: 'Mã sinh viên'),

                  const SizedBox(height: 20),
                  
                  MyTextfield(
                    controller: studentIDController,
                    hintText: '102210xxxxx',
                    obsecureText: false,
                  ),

                  const SizedBox(height: 20),

                  MyButton(
                    onTap: () {
                      context.read<UpdateBloc>().add(UpdateUserDataEvent(
                        name: nameController.text,
                        gender: genderController.text,
                        dateOfBirth: dateOfBirthController.text,
                        faculty: facultyController.text,
                        studentId: studentIDController.text,
                      ));
                    },
                    text: 'Xác nhận',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
