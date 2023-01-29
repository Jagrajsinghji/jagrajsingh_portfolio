import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jagrajsingh_portfolio/pages/homepage.dart';
import 'package:jagrajsingh_portfolio/utils/my_theme.dart';

late final BrowserName browserName;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  browserName = (await deviceInfo.webBrowserInfo).browserName;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jagraj Singh | Not a regular engineer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(),
          primaryColor: MyTheme.whatStandButton),
      home: const Homepage(),
    );
  }
}
