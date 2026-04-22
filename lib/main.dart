import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neural Nexus Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF00B4D8),
      ),
      home: HomePage(),
    );
  }
}