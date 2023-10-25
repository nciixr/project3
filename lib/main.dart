// ignore: unused_import
import 'package:project3/screen/Home_screen.dart';
import 'package:project3/screen/otp.dart';
import 'package:project3/screen/signup.dart';

import 'Auth.dart';
import 'screen/signin.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:signup(),

      // //home: const Auth(),
      // routes: {
      //   //'/':(context) => const Auth(),
      //   'homescreen':(context) => const HomeScreen(),
      //   'signup':(context) => const signup(),
      //   'signin':(context) => const LoginScreen(),
      // },
    );
  }
}