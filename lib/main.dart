import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:jagrajsingh_portfolio/pages/homepage.dart';
import 'package:jagrajsingh_portfolio/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'utils/globals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  browserName = (await deviceInfo.webBrowserInfo).browserName;
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (c) => ThemeProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _updateThemeMode();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    _updateThemeMode();
  }

  void _updateThemeMode() {
    final Brightness brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    setState(() {
      _themeMode =
          brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
      context.read<ThemeProvider>().themeMode = _themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    _themeMode = themeProvider.themeMode;
    return MaterialApp(
      title: 'Jagraj Singh',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
      themeAnimationDuration: Duration(milliseconds: 300),
      themeAnimationCurve: Curves.easeInOutCubic,
      home: Homepage(),
    );
  }
}
