import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme() {
    themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  Color get headingColor => isDarkMode ? Colors.white : Colors.black;

  Color get bodyTextColor => isDarkMode ? Colors.white : Colors.black;

  TextTheme get textTheme => GoogleFonts.poppinsTextTheme(TextTheme(
        headlineLarge: TextStyle(
            fontSize: 26, fontWeight: FontWeight.w600, color: headingColor),
        headlineMedium: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: headingColor),
        headlineSmall: TextStyle(fontSize: 14, color: headingColor),

        // all titles bold
        titleLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: bodyTextColor),
        titleMedium: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: bodyTextColor),
        titleSmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: bodyTextColor),

        // all body text not bold
        bodyLarge: TextStyle(fontSize: 20, color: bodyTextColor),
        bodyMedium: TextStyle(fontSize: 16, color: bodyTextColor),
        bodySmall: TextStyle(fontSize: 12, color: bodyTextColor),
      ));

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.black12,
        hoverColor: bgColorLight1.withValues(alpha: .7),
        cardColor: bgColorLight2.withValues(alpha: .7),
        textTheme: textTheme,
        iconTheme: IconThemeData(color: Colors.black),
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
        menuTheme: MenuThemeData(
          style: MenuStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white),
            shadowColor: WidgetStateProperty.all(Colors.grey.shade300),
            surfaceTintColor: WidgetStateProperty.all(Colors.grey.shade100),
            elevation: WidgetStateProperty.all(4),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColorDark1,
        hoverColor: bgColorDark2.withValues(alpha: .7),
        cardColor: bgColorDark1.withValues(alpha: 0.9),
        textTheme: textTheme,
        iconTheme: IconThemeData(color: Colors.white),
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: bgColorDark1),
        menuTheme: MenuThemeData(
          style: MenuStyle(
            backgroundColor: WidgetStateProperty.all(bgColorDark1),
            shadowColor: WidgetStateProperty.all(Colors.grey.shade800),
            surfaceTintColor: WidgetStateProperty.all(Colors.grey.shade700),
            elevation: WidgetStateProperty.all(4),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
      );

  final Color primaryColor = Color(0xFF73173D);

  LinearGradient homeGradient(num angle) =>
      isDarkMode ? darkGradient(angle) : lightGradient(angle);

  final bgColorLight1 = Color(0xFF85A1A1);
  final bgColorLight2 = Color(0xFFAB8B98);

  final bgColorDark1 = Color(0xFF003153);
  final bgColorDark2 = Color(0xFF1B1B1B);

  final containersColor = Color(0xFFFFFDD0).withValues(alpha: .5);
  final sikhNotesColor1 = Color(0xffefdeb3);
  final sikhNotesColor2 = Color(0xfff3a873);
  final studentSyncColor = Color(0xff1472fb);
  final apparelMarketplaceColor = Color(0xffafb9b6);

  LinearGradient darkGradient(num angle) => LinearGradient(
      colors: [bgColorDark1, bgColorDark2],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      transform: GradientRotation(angle * pi / 180));

  LinearGradient lightGradient(num angle) => LinearGradient(
      colors: [bgColorLight1, bgColorLight2],
      begin: Alignment.center,
      end: Alignment.centerRight,
      transform: GradientRotation(angle * pi / 180));
}
