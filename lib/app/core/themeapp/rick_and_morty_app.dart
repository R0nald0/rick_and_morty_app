import 'package:flutter/material.dart';

final class RickAndMortyAppTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.amber,
  
   progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.amber),
    textTheme: TextTheme(
        bodyLarge: TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        )),
  );
}
