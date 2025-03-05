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

// class ActivityDetailPage extends StatefulWidget {
//   final String title;
//   final String imagePath;
//   final String day;
//   final String location;
//   const ActivityDetailPage({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.day,
//     required this.location,
//   });

//   @override
//   State<ActivityDetailPage> createState() => _ActivityDetailPageState();
// }

// class _ActivityDetailPageState extends State<ActivityDetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppbar(
//         onPressed: () => Navigator.pop(context),
//         // onSelected: (value) {
//         //   Navigator.push(
//         //     context,
//         //     MaterialPageRoute(
//         //       builder: (context) => const HomePage(selectedCategory: 'All'),
//         //     ),
//         //   );
//         // },
//         icon: Icons.arrow_back_ios_new,
//       ),
//       drawer: MyDrawer(
//         onSelectCategory: (category) {},
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Center(
//           child: Column(
//             children: [
//               const SizedBox(height: 10),
//               // title
//               MyHeading(text: widget.title),
//               const SizedBox(height: 15),
//               // image
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Image.asset(
//                   widget.imagePath,
//                   width: double.infinity,
//                   height: 250,
//                   fit: BoxFit.cover, // Ensure the image covers the entire area
//                 ),
//               ),
//               const SizedBox(height: 20),
//               // text
//               const Text(
//                 'Số lượng sinh viên đã đăng ký',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 21, 63, 133),
//                   fontFamily: 'Poppins-Semibold',
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),

//               const SizedBox(height: 20),
//               // number of register
//               Container(
//                 padding: const EdgeInsets.all(8.0),
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 0, 80, 157),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Text(
//                   '50',
//                   style: TextStyle(
//                     fontSize: 25, // Font size
//                     fontWeight: FontWeight.bold, // Font weight
//                     color: Colors.white, // Text color
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 25),
//               // infor detail
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Mô tả',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 21, 63, 133),
//                         fontFamily: 'Poppins-SemiBold',
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     // minimum
//                     const Padding(
//                       padding: EdgeInsets.only(left: 12.0, top: 4.0),
//                       child: Row(
//                         children: [
//                           Text(
//                             'Nhân sự tối thiểu: ',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 40, 117, 187),
//                               fontFamily: 'Poppins-Semibold',
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             '20 cán bộ',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 40, 117, 187),
//                               fontFamily: 'Poppins-Medium',
//                             ),
//                           )
//                         ],
//                       ),
//                     ),

//                     // maximum
//                     const Padding(
//                       padding: EdgeInsets.only(left: 12.0, top: 4.0),
//                       child: Row(
//                         children: [
//                           Text(
//                             'Nhân sự tối đa: ',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 40, 117, 187),
//                               fontFamily: 'Poppins-Semibold',
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             '30 cán bộ',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 40, 117, 187),
//                               fontFamily: 'Poppins-Medium',
//                             ),
//                           )
//                         ],
//                       ),
//                     ),

//                     // time
//                     Padding(
//                       padding: const EdgeInsets.only(left: 12.0, top: 4.0),
//                       child: Row(
//                         children: [
//                           const Text(
//                             'Thời gian: ',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 40, 117, 187),
//                               fontFamily: 'Poppins-Semibold',
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             widget.day,
//                             style: const TextStyle(
//                               color: Color.fromARGB(255, 40, 117, 187),
//                               fontFamily: 'Poppins-Medium',
//                             ),
//                           )
//                         ],
//                       ),
//                     ),

//                     //location
//                     Padding(
//                       padding: const EdgeInsets.only(left: 12.0, top: 4.0),
//                       child: Row(
//                         children: [
//                           const Text(
//                             'Địa điểm: ',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 40, 117, 187),
//                               fontFamily: 'Poppins-Semibold',
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             widget.location,
//                             style: const TextStyle(
//                               color: Color.fromARGB(255, 40, 117, 187),
//                               fontFamily: 'Poppins-Medium',
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // button
//               const MyButton(text: 'Đăng ký'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
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
          registered: 50, // Giả sử giá trị mặc định
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
                      const Text(
                        'Số lượng sinh viên đã đăng ký',
                        style: TextStyle(
                          color: Color.fromARGB(255, 21, 63, 133),
                          fontFamily: 'Poppins-Semibold',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 0, 80, 157),
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
                            const Text(
                              'Mô tả',
                              style: TextStyle(
                                color: Color.fromARGB(255, 21, 63, 133),
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
                                  const Text(
                                    'Thời gian: ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 40, 117, 187),
                                      fontFamily: 'Poppins-Semibold',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    state.day,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 40, 117, 187),
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
                                  const Text(
                                    'Địa điểm: ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 40, 117, 187),
                                      fontFamily: 'Poppins-Semibold',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    state.location,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 40, 117, 187),
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
                      const MyButton(text: 'Đăng ký'),
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
