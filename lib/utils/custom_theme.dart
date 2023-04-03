import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// light theme
ThemeData customLightTheme(
  BuildContext context,
) {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      platform: defaultTargetPlatform,
      primaryColor: Colors.white,
      primaryIconTheme: IconThemeData(color: Colors.black),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Color.fromRGBO(37, 112, 252, 1)),
      unselectedWidgetColor: Colors.grey,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      secondaryHeaderColor: Color.fromRGBO(37, 112, 252, 1),
      cardColor: Color.fromRGBO(239, 242, 248, 1),
      iconTheme: IconThemeData(color: Colors.black),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.black.withOpacity(.5),
      ),
      appBarTheme: AppBarTheme(elevation: 0, color: Colors.white, iconTheme: IconThemeData(color: Colors.black)),
      textTheme: Typography.material2018(platform: defaultTargetPlatform).white.copyWith(
            bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
            bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
            bodySmall: TextStyle(color: Colors.black, fontSize: 12),
            displayLarge: TextStyle(color: Colors.black, fontSize: 96),
            displayMedium: TextStyle(color: Colors.black, fontSize: 60),
            displaySmall: TextStyle(color: Colors.black, fontSize: 48),
            headlineMedium: TextStyle(color: Colors.black, fontSize: 34),
            headlineSmall: TextStyle(color: Colors.black, fontSize: 24),
            titleLarge: TextStyle(color: Colors.black, fontSize: 20),
            titleMedium: TextStyle(color: Colors.black, fontSize: 16),
            titleSmall: TextStyle(color: Colors.black, fontSize: 14),
            labelSmall: TextStyle(color: Colors.black, fontSize: 10),
            labelLarge: TextStyle(color: Colors.black, fontSize: 16),
          ),
      dividerColor: Colors.grey,
      textSelectionTheme: TextSelectionThemeData(cursorColor: Color.fromRGBO(37, 112, 252, 1)));
}

///dark theme
ThemeData customDarkTheme(
  BuildContext context,
) {
  return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Colors.black,
      primaryIconTheme: IconThemeData(color: Colors.grey),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Color.fromRGBO(31, 31, 31, 1)),
      platform: defaultTargetPlatform,
      unselectedWidgetColor: Colors.grey,
      brightness: Brightness.dark,
      secondaryHeaderColor: Color.fromRGBO(31, 31, 50, 1),
      fontFamily: GoogleFonts.montserrat().fontFamily,
      cardColor: Color.fromRGBO(31, 31, 31, 1),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.white.withOpacity(.7),
      ),
      appBarTheme: AppBarTheme(elevation: 0, color: Colors.white,iconTheme: IconThemeData(color: Colors.black) ),
      textTheme: Typography.material2018(platform: defaultTargetPlatform).white.copyWith(
            bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
            bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
            bodySmall: TextStyle(color: Colors.white, fontSize: 12),
            displayLarge: TextStyle(color: Colors.white, fontSize: 96),
            displayMedium: TextStyle(color: Colors.white, fontSize: 60),
            displaySmall: TextStyle(color: Colors.white, fontSize: 48),
            headlineMedium: TextStyle(color: Colors.white, fontSize: 34),
            headlineSmall: TextStyle(color: Colors.white, fontSize: 24),
            titleLarge: TextStyle(color: Colors.white, fontSize: 20),
            titleMedium: TextStyle(color: Colors.white, fontSize: 16),
            titleSmall: TextStyle(color: Colors.white, fontSize: 14),
            labelSmall: TextStyle(color: Colors.white, fontSize: 10),
            labelLarge: TextStyle(color: Colors.white, fontSize: 16),
          ),
      iconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.white.withOpacity(.6),
      textSelectionTheme: TextSelectionThemeData(cursorColor: Color.fromRGBO(105, 73, 199, 1)));
}
