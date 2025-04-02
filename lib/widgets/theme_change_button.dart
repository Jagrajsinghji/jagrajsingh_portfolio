import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeChangeButton extends StatelessWidget {
  const ThemeChangeButton({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    return IconButton(
      onPressed: themeProvider.toggleTheme,
      tooltip: "Switch Theme",
      icon: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          return RotationTransition(
            turns: animation,
            child: ScaleTransition(scale: animation, child: child),
          );
        },
        child: themeProvider.isDarkMode
            ? Icon(
                Icons.dark_mode,
                key: ValueKey('dark'),
                color: Colors.purpleAccent,
                size: 30,
              )
            : Icon(
                Icons.light_mode,
                key: ValueKey('light'),
                color: Colors.amberAccent,
                size: 30,
              ),
      ),
    );
  }
}
