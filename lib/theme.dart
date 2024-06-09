import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  return ThemeData(
    primaryColor: Colors.teal,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.teal),
      titleTextStyle: TextStyle(
        color: Colors.teal,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.teal,
      unselectedLabelColor: Color(0x998B8B8B),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.teal,
            width: 2.0,
          ),
        ),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black87),
      titleLarge: TextStyle(
          color: Colors.teal, fontSize: 24, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.teal),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
    ),
    dividerColor: Colors.grey[300],
    iconTheme: const IconThemeData(
      color: Colors.teal,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.teal,
    ),
    brightness: Brightness.light,
  );
}

ThemeData buildDarkThemeData() {
  return ThemeData(
    primaryColor: Colors.teal,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.teal),
      titleTextStyle: TextStyle(
        color: Colors.teal,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.teal,
      unselectedLabelColor: Colors.white70,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.teal,
            width: 2.0,
          ),
        ),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white70),
      titleLarge: TextStyle(
          color: Colors.teal, fontSize: 24, fontWeight: FontWeight.bold),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.teal),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
    ),
    dividerColor: Colors.grey[700],
    iconTheme: const IconThemeData(
      color: Colors.teal,
    ),
    colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark).copyWith(
      secondary: Colors.teal,
    ),
    brightness: Brightness.dark,
  );
}
