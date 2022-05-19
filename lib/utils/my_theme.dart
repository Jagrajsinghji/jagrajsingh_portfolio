import 'package:flutter/material.dart';

class MyTheme {
  static Color primary = Colors.grey.shade300;
  static Color accent = Colors.grey.withOpacity(.8);
  static const Color text = Colors.black87;
  static Color button = Colors.grey.shade100;
  static const Color greenBush = Color(0xffBABD42);
  static const Color brownTrunk = Color(0xff7E370C);
  static Color greenDark = const Color(0xff17706E).withOpacity(.6);
  static const Color white = Colors.white;
  static const BoxShadow journeyBoxShadow = BoxShadow(
      color: Colors.black38,
      blurRadius: 3,
      spreadRadius: 2,
      offset: Offset(0, 2));
  static const Color maroon = Color(0xffa20906);
  static const Color pinkDark = Color(0xffe87b8b);

  static const Color nameText = Color(0xff112B3A);
  static const Color whatStandButton = Color(0xffFFE59D);
}
