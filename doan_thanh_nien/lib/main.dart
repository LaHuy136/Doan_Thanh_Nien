// import 'package:doan_thanh_nien/pages/home_page.dart';
import 'package:doan_thanh_nien/bloc/activity_bloc.dart';
import 'package:doan_thanh_nien/bloc/home_bloc.dart';
import 'package:doan_thanh_nien/bloc/login_bloc.dart';
import 'package:doan_thanh_nien/bloc/profile_bloc.dart';
import 'package:doan_thanh_nien/bloc/signup_bloc.dart';
import 'package:doan_thanh_nien/bloc/update_bloc.dart';
import 'package:doan_thanh_nien/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/drawer_bloc.dart';
import 'bloc/event/drawer_event.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ActivityDetailBloc()), 
        BlocProvider(create: (context) => HomeBloc('All')), 
        BlocProvider(create: (context) => DrawerBloc()..add(LoadUserDataEvent())),
        BlocProvider(create: (context) => LoginBloc(context)), 
        BlocProvider(create: (context) => SignUpBloc(context)), 
        BlocProvider(create: (context) => UpdateBloc()),
        BlocProvider(create: (context) => ProfileBloc()), 
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đoàn Thanh Niên',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}
