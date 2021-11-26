import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Mytheme {
  static ThemeData light = ThemeData(
    primaryColor: Mycolors.primaryc,
    backgroundColor: Mycolors.backc,
    fontFamily: GoogleFonts.lato().fontFamily,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 40.0,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}

class Mycolors {
  static final backc = HexColor("#d4ffd9");
  static const primaryc = Colors.white;
}
