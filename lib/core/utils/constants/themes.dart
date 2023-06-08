import 'package:flutter/material.dart';
import 'package:notes_app_with_fire_base/core/utils/constants/custom_colors.dart';

ThemeData darkTheme() {
  return ThemeData(
      platform: TargetPlatform.iOS,
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.90),
          borderSide: const BorderSide(width: 1, color: customGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),
          borderSide: const BorderSide(width: 1, color: customWhite),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),
          borderSide: const BorderSide(width: 1, color: customWhite),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),
          borderSide: const BorderSide(width: 1, color: customRed),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),
          borderSide: const BorderSide(width: 1, color: customWhite),
        ),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: customWhite,
        onPrimary: customWhite,
        secondary: customWhite,
        onSecondary: customWhite,
        primaryContainer: customWhite,
        error: customRed,
        onError: customRed,
        background: customWhite,
        onBackground: customWhite,
        surface: customWhite,
        onSurface: customWhite,
      ),
      scaffoldBackgroundColor: customBlack,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: customWhite),
        titleTextStyle: TextStyle(color: customWhite, fontSize: 16),
        elevation: 0,
        backgroundColor: customBlack,
      ),
      iconTheme: const IconThemeData(color: customWhite),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: customRed,
          enableFeedback: true,
          selectedLabelStyle: TextStyle(fontSize: 16),
          selectedItemColor: Colors.grey));
}

ThemeData lightTheme() {
  return ThemeData(
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.90),
          borderSide: const BorderSide(width: 1, color: customGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),
          borderSide: const BorderSide(width: 1, color: customBlack),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),
          borderSide: const BorderSide(width: 1, color: customBlack),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),
          borderSide: const BorderSide(width: 1, color: customBlack),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.90),
          borderSide: const BorderSide(width: 1, color: customBlack),
        ),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: customBlue,
        onPrimary: customBlack,
        secondary: customBlack,
        onSecondary: customBlack,
        primaryContainer: customBlack,
        error: customRed,
        onError: customRed,
        background: customBlack,
        onBackground: customBlack,
        surface: customBlack,
        onSurface: customBlack,
      ),
      scaffoldBackgroundColor: customWhite,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: customGrey),
        titleTextStyle: TextStyle(color: customGrey, fontSize: 20),
        elevation: 0,
        backgroundColor: customBlack,
      ),
      iconTheme: const IconThemeData(color: customBlack),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: customRed,
          enableFeedback: true,
          selectedLabelStyle: TextStyle(fontSize: 16),
          selectedItemColor: customGrey));
}
