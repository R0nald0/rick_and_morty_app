import 'package:flutter/material.dart';

final class RickAndMortyAppTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
        titleMedium: TextStyle(
            fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        )),
  );
}
