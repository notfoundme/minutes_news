import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MTextTheme {
  static TextStyle heading1 = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  static TextStyle content1 = GoogleFonts.poppins(
    // fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.grey[700],
    height: 1.8,
  );

  static TextStyle contentSmall = GoogleFonts.poppins(
    // fontWeight: FontWeight.w500,
    fontSize: 13,
    color: Colors.grey[500],
    height: 1.8,
  );

  static TextStyle headingWhite = GoogleFonts.poppins(
    // fontWeight: FontWeight.w500,
    color: Colors.white70,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static TextStyle contentWhite = GoogleFonts.poppins(
    // fontWeight: FontWeight.w500,
    fontSize: 13,

    color: Colors.white70,
    fontWeight: FontWeight.w200,
  );
}