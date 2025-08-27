import 'package:expenselog/core/themes/light_mode.dart';
import 'package:flutter/material.dart';



import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dark_mode.dart';


// A State notifier that manages app's current ThemeData (light or dark)

class ThemeNotifier extends StateNotifier<ThemeData> {

  //initializes the theme with light mode by default.

  ThemeNotifier() : super(lightMode);

  // return true if current theme is dark mode
  bool get isDark => state == darkMode;

  //toggle between light and dark themes
  void toggleTheme () {
    state = isDark? lightMode : darkMode;
  }

  //allow setting a specific theme themedata manually
  void setTheme(ThemeData theme) {
    state = theme;
  }




}

//global riverpod provider to expose current theme data and allow access to ThemeNotifier for toggling  the theme

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>(
        (ref) => ThemeNotifier()
);