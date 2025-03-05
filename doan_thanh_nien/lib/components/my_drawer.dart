// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:doan_thanh_nien/components/my_drawer_tile.dart';
import 'package:doan_thanh_nien/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/drawer_bloc.dart';
import '../bloc/event/drawer_event.dart';
import '../bloc/state/drawer_state.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import 'my_dropdown.dart';

@override
class MyDrawer extends StatelessWidget {
  final Function(String) onSelectCategory;
  const MyDrawer({
    super.key,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerBloc()..add(LoadUserDataEvent()),
      child: Drawer(
        backgroundColor: Colors.white,
        child: BlocBuilder<DrawerBloc, DrawerState>(
          builder: (context, state) {
            return Column(
              children: [
                // logo doanthanhnien
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/images/logo_doan.jpg',
                          width: 76,
                          height: 76,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.name,
                            style: const TextStyle(
                                fontFamily: 'OpenSans-Bold',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Trường đại học Bách Khoa',
                            style: TextStyle(
                              fontFamily: 'OpenSans-Regular',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Divider(color: Color.fromARGB(255, 239, 239, 239)),
                ),

                // home
                MyDrawerTile(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(selectedCategory: 'All'),
                      ),
                    );
                  },
                  text: 'Trang chủ',
                  icon: Icons.home_outlined,
                ),

                const SizedBox(height: 15),

                // profile list tile
                MyDrawerTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  text: 'Thông tin cá nhân',
                  icon: Icons.person_4_outlined,
                ),

                const SizedBox(height: 15),

                // volunteer activities list tile
                MyDropdown(
                  onSelect: (value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(selectedCategory: value),
                      ),
                    );
                  },
                  text: 'Hoạt động tình nguyện',
                  icon: Icons.volunteer_activism_outlined,
                ),

                const SizedBox(height: 15),

                const MyDrawerTile(
                  text: 'Tin tức / Sự kiện',
                  icon: Icons.date_range_outlined,
                ),

                const Spacer(),

                // logout list tile
                MyDrawerTile(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  ),
                  text: 'Đăng xuất',
                  icon: Icons.logout_outlined,
                ),

                const SizedBox(height: 25),
              ],
            );
          },
        ),
      ),
    );
  }
}
