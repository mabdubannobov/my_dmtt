import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_dmtt/features/main_screen.dart';
import 'package:my_dmtt/features/walkthrough/screens/splash.dart';
import 'package:my_dmtt/features/walkthrough/screens/welcome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
