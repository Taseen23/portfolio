import 'package:flutter/material.dart';

import '../constants/colors.dart';

ThemeData kCustomTheme = ThemeData.dark().copyWith(
  iconTheme: const IconThemeData(
    color: CustomColor.whitePrimary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 34, 172, 231),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      fixedSize: const Size.fromHeight(45),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),
);
