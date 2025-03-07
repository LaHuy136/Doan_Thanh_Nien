// ignore_for_file: library_private_types_in_public_api

import 'package:doan_thanh_nien/pages/activity_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/event/home_event.dart';
import '../bloc/home_bloc.dart';
import '../bloc/state/home_state.dart';
import '../components/my_activity_tile.dart';
import '../components/my_appbar.dart';
import '../components/my_drawer.dart';
import '../components/my_heading.dart';

class HomePage extends StatefulWidget {
  final String selectedCategory;
  const HomePage({super.key, required this.selectedCategory});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(widget.selectedCategory)..add(FetchActivitiesEvent()),
      child: Scaffold(
        appBar: MyAppbar(
          onPressed: () {},
          icon: Icons.search_outlined,
        ),
        drawer: MyDrawer(
          onSelectCategory: (category) {
            setState(() {
              selectedCategory = category;
            });
            context
                .read<HomeBloc>()
                .add(FetchActivitiesEvent(category: category));
          },
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const MyHeading(text: 'Các hoạt động nổi bật'),
                  const SizedBox(height: 25),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.activities.length,
                      itemBuilder: (context, index) {
                        final activity = state.activities[index];
                        return MyActivityTile(
                          activity: activity,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ActivityDetailPage(
                                title: activity.title,
                                imagePath: activity.imagePath,
                                day: activity.day,
                                location: activity.location,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
