import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Jagraj Singh | Not a Regular Engineer',
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
