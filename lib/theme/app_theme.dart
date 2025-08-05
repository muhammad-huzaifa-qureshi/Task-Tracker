import 'package:flutter/material.dart';

class AppTheme{

  // color scheme
  static const ColorScheme _colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.black,
      onSecondary: Colors.white,
      error: Colors.red, onError:
      Colors.white,
      surface: Colors.white,
      onSurface: Colors.black
  );

  // text theme
  static final TextTheme _textTheme = TextTheme(

      // Medium Title
      titleMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: _colorScheme.primary
      ),

      // Medium Body
      bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: _colorScheme.secondary
      )
  );


  // light theme
  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: _colorScheme,
    textTheme: _textTheme
  );
}