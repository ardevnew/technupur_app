import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

final ThemeData lightTheme = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme(),
  scaffoldBackgroundColor: kFWhiteColor,
  fontFamily: AppFonts.POPPINS,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: kSecondaryColor,
  ),
  splashColor: kSecondaryColor.withOpacity(0.10),
  highlightColor: kSecondaryColor.withOpacity(0.10),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kSecondaryColor.withOpacity(0.1),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: kSecondaryColor,
  ),
);
