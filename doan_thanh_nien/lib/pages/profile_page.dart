// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/event/profile_event.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/state/profle_state.dart';
import '../components/my_appbar.dart';
import '../components/my_divider.dart';
import '../components/my_avatar.dart';
import '../components/my_button.dart';
import '../components/my_drawer.dart';
import '../components/my_heading.dart';
import '../themes/colors.dart';
import 'home_page.dart';
import 'update_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _initializeSharedPreferences();
  }

  Future<void> _initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    context
        .read<ProfileBloc>()
        .add(LoadProfile()); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(
              selectedCategory: 'All',
            ),
          ),
        ),
        icon: Icons.arrow_back_ios_new,
      ),
      drawer: MyDrawer(onSelectCategory: (category) {}),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyHeading(text: 'Thông tin cá nhân'),
                  const SizedBox(height: 20),
                  const MyAvatar(),
                  const MyDivider(),
                  Row(
                    children: [
                      _buildLabelColumn(),
                      _buildValueColumn(context, state),
                    ],
                  ),
                  const SizedBox(height: 35),
                  MyButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdatePage(
                            name: state.name,
                            gender: state.gender,
                            dateOfBirth: state.dateOfBirth,
                            faculty: state.faculty,
                            studentId: state.studentId,
                          ),
                        ),
                      );
                    },
                    text: 'Cập nhật',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLabelColumn() {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabelText('Họ và tên'),
          _buildLabelText('Giới tính'),
          _buildLabelText('Ngày sinh'),
          _buildLabelText('Khoa - Lớp'),
          _buildLabelText('Mã sinh viên'),
          _buildLabelText('Chức vụ'),
        ],
      ),
    );
  }

  Widget _buildValueColumn(BuildContext context, ProfileState state) {
    return Container(
      margin: const EdgeInsets.only(left: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildValueText(state.name),
          _buildValueText(state.gender),
          _buildValueText(state.dateOfBirth),
          _buildValueText(state.faculty),
          _buildValueText(state.studentId),
          _buildValueText('Sinh viên'),
        ],
      ),
    );
  }

  Widget _buildLabelText(String text) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.left,
          text,
          style: TextStyle(
            color: AppColor.textColor,
            fontFamily: 'Poppins-Regular',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const MyDivider(),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildValueText(String text) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.left,
          text,
          style: TextStyle(
            color: AppColor.textColor,
            fontFamily: 'Poppins-Medium',
            fontSize: 18,
          ),
        ),
        const MyDivider(),
        const SizedBox(height: 12),
      ],
    );
  }
}
