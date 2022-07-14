import 'package:bmi/constant/constant.dart';
import 'package:bmi/screen/bmi_data_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI APP',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor:
              // #0A0E21
              Color(0xff0A0E21),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const BmiDataScreen(),
    );
  }
}
