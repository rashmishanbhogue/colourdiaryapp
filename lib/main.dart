// main.dart

import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ColourDiaryApp());
}

class ColourDiaryApp extends StatelessWidget {
  const ColourDiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'colour diary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAF8F5),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}
