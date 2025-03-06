// ignore_for_file: unnecessary_string_interpolations

import 'package:doan_thanh_nien/components/my_appbar.dart';
import 'package:doan_thanh_nien/components/my_button.dart';
import 'package:doan_thanh_nien/components/my_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/activity_bloc.dart';
import '../bloc/event/activity_event.dart';
import '../bloc/state/activity_state.dart';
import '../components/my_drawer.dart';
import '../themes/colors.dart';

class ActivityDetailPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String day;
  final String location;

  const ActivityDetailPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.day,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityDetailBloc()
        ..add(LoadActivityDetail(
          title: title,
          imagePath: imagePath,
          day: day,
          location: location,
          registered: 50,
        )),
      child: Scaffold(
        appBar: MyAppbar(
          onPressed: () => Navigator.pop(context),
          icon: Icons.arrow_back_ios_new,
        ),
        drawer: MyDrawer(
          onSelectCategory: (category) {},
        ),
        body: BlocBuilder<ActivityDetailBloc, ActivityDetailState>(
          builder: (context, state) {
            if (state is ActivityDetailLoaded) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      MyHeading(text: state.title),
                      const SizedBox(height: 15),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          state.imagePath,
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Số lượng sinh viên đã đăng ký',
                        style: TextStyle(
                          color: AppColor.headingColor,
                          fontFamily: 'Poppins-Semibold',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: AppColor.textColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${state.registered}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mô tả',
                              style: TextStyle(
                                color: AppColor.headingColor,
                                fontFamily: 'Poppins-SemiBold',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 4.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Thời gian: ',
                                    style: TextStyle(
                                      color: AppColor.textColor,
                                      fontFamily: 'Poppins-Semibold',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    state.day,
                                    style: TextStyle(
                                      color: AppColor.textColor,
                                      fontFamily: 'Poppins-Medium',
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 4.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Địa điểm: ',
                                    style: TextStyle(
                                      color: AppColor.textColor,
                                      fontFamily: 'Poppins-Semibold',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    state.location,
                                    style: TextStyle(
                                      color: AppColor.textColor,
                                      fontFamily: 'Poppins-Medium',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      const MyButton(text: 'Đăng ký',),
                    ],
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
