import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
    ),

    accentColor: Colors.pink,
    primaryColor: Colors.green,
    hintColor: Colors.grey,
    scaffoldBackgroundColor: Colors.lightBlueAccent[50],
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black54),
      titleMedium: TextStyle(color: Colors.black54),
      titleSmall: TextStyle(color: Colors.black54),
    ),
    appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 15,
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        titleTextStyle: TextStyle(
            color: Colors.black54,
            fontSize: 28,
            fontWeight: FontWeight.w700

        )
    ),
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.blueGrey[900],
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 15,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w700

        )
    ),
  );
}