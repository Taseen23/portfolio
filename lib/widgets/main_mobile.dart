import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Container(
      color: Color.fromARGB(255, 175, 181, 241),
      margin: const EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 30.0,
      ),
      height: screenHeight,
      constraints: const BoxConstraints(
        minHeight: 560.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // avatar img
          Image.asset(
            "assets/1722781495389.png",
            width: screenWidth,
          ),
          const SizedBox(height: 30),
          // intro message
          Expanded(
            child: const Text(
              "Hi,\nI'm Taseen Alam Dehan\nA Flutter Developer",
              style: TextStyle(
                fontSize: 24,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 8, 8, 8),
              ),
            ),
          ),
          const SizedBox(height: 15),
          // contact btn
        ],
      ),
    );
  }
}
