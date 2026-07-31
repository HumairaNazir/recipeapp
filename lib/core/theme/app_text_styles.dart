import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

twentyEight700TextStyle({color}) {
  return TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: color,
    fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
  );
}

eighteen400TextStyle({color}) {
  return TextStyle(
    fontSize: 18,
    color: color,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily,
  );
}

sixteen700TextStyle({color}) {
  return TextStyle(
    fontSize: 17,
    color: color,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily,
  );
}

fourteen600TextStyle({color}) {
  return TextStyle(
    fontSize: 14,
    color: color,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily,
  );
}

underlineTextStyle({color}) {
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: color,
    decoration: TextDecoration.underline,
    decorationColor: Colors.deepOrange,
    fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
  );
}
