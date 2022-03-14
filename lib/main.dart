import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:upworkestebantest/ui/screens/main_screen.dart';

import 'resources/font_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Upwork Esteban Test',
          theme: ThemeData(
              bottomAppBarColor: const Color(0xFF9A50E0),
              appBarTheme: AppBarTheme(color: Color(0xFFba6bd8)),
              primaryColor: const Color(0xFFBA6BD8),
              iconTheme: const IconThemeData(color: Colors.white),
              colorScheme: const ColorScheme(
                  brightness: Brightness.light,
                  primary: Color(0xFFBA6BD8),
                  onPrimary: Color(0xFFE0E5EC),
                  secondary: Color(0xFF9A50E0),
                  onSecondary: Color(0xFFFFFFFF),
                  error: Colors.red,
                  onError: Colors.red,
                  background: Color(0xFFE0E5EC),
                  onBackground: Color(0xFFFFFFFF),
                  surface: Color(0xFFFFFFFF),
                  onSurface: Color(0xFFFFFFFF)),
              primarySwatch: Colors.grey,
              textTheme: textTheme),
          home: const MyHomePage(),
        );
      },
    );
  }
}
