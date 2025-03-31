import 'package:flutter/material.dart';
import 'package:food_order/screen/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Ordering App',
      home: SplashScreen(),
    );
  }
}