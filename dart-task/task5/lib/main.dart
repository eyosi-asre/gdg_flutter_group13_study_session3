import 'package:flutter/material.dart';
import 'package:task5/pages/loginscreen.dart';
import 'package:task5/pages/signupscreen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => Scaffold(body: Center(child: Text('Home Screen'))),
      },
    );
  }
}