import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jagrajsingh_portfolio/pages/homepage.dart';
import 'package:jagrajsingh_portfolio/utils/my_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jagraj Singh | Not a Regular Engineer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.latoTextTheme(),primaryColor: MyTheme.whatStandButton),
      home: const Homepage(),
    );
  }
}
