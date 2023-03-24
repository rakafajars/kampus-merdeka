import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/colors_style.dart';
import 'package:google_fonts/google_fonts.dart';

class TextCustome {
  TextStyle m3Medium = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    color: ColorStyle().m3Black,
  );

  TextStyle m3TitleMedium = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: ColorStyle().blue,
  );
}
