import 'package:flutter/material.dart';

class TTextAppTheme {
  TTextAppTheme._();

  // customizable light text theme
  static TextTheme lightTextTheme = TextTheme(
    //headline
    headlineLarge: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
     headlineSmall: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),

    //title
    titleLarge: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),

    //body
    bodyLarge: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: const TextStyle().copyWith(
      color: Colors.black.withOpacity(0.5),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),

    //label
    labelLarge: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: const TextStyle().copyWith(
      color: Colors.black.withOpacity(0.5),
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
   
    
   
  );

  // customizable dark text theme
  static TextTheme darkTextTheme = TextTheme(
     //headline
    headlineLarge: const TextStyle().copyWith(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: const TextStyle().copyWith(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: const TextStyle().copyWith(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),

    //title
    titleLarge: const TextStyle().copyWith(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: const TextStyle().copyWith(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: const TextStyle().copyWith(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),

    //body
    bodyLarge: const TextStyle().copyWith(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: const TextStyle().copyWith(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: const TextStyle().copyWith(
      color: Colors.white.withOpacity(0.5),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),

    //label
    labelLarge: const TextStyle().copyWith(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: const TextStyle().copyWith(
      color: Colors.white.withOpacity(0.5),
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
   
  );
}
