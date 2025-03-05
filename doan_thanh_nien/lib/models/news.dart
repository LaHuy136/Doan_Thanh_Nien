// import 'package:doan_thanh_nien/components/my_icon_button_date.dart';
import 'package:flutter/material.dart';

import 'volunteer_activities.dart';

class News extends ChangeNotifier {
  // list of activity
  final List<volunteerActivities> _activity = [
    // works
    volunteerActivities(
      imagePath: 'assets/images/mua_he.jpg',
      title: 'Mùa hè xanh 2024',
      day: '27/08/2024 - 10/10/2024',
      location: 'Xã Pá Hu, huyện Trạm Tấu, Tỉnh Yên Bái',
      category: volunteerActivitiesCategory.works,
    ),

    // gifts
    volunteerActivities(
      imagePath: 'assets/images/hien_mau.jpg',
      title: 'Hiến máu nhân đạo',
      day: '20/08/2024 - 22/08/2024',
      location: 'Trường Đại học Bách Khoa Hà Nội',
      category: volunteerActivitiesCategory.gifts,
    ),

    // supports
    volunteerActivities(
      imagePath: 'assets/images/tiep_suc.jpg',
      title: 'Tiếp sức mùa thi 2024',
      day: '27/07/2024 - 05/08/2024',
      location: 'Trường THCS Phú Diễn A, Hà Nội',
      category: volunteerActivitiesCategory.supports,
    ),

    // another
    volunteerActivities(
      imagePath: 'assets/images/trong_cay.jpg',
      title: 'Trồng cây xanh 2024',
      day: '18/09/2024 - 20/09/2024',
      location: 'Công viên Thống Nhất, Hà Nội',
      category: volunteerActivitiesCategory.another,
    ),
  ];

  List<volunteerActivities> getActivitiesByCategory(String category) {
    if (category == 'All') {
      return _activity;
    }
    return _activity
        .where((activity) =>
            activity.category.toString().split('.').last == category)
        .toList();
  }
}
