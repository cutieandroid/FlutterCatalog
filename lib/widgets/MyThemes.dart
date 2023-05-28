import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {

  static ThemeData lighttheme(BuildContext context) =>

      ThemeData(primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts
              .poppins()
              .fontFamily,
          appBarTheme: const AppBarTheme(
              color: Colors.white,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 20)


          )
      );

  static ThemeData darktheme(BuildContext context) =>
      ThemeData(
          brightness: Brightness.dark
      );

  static Color creamcolor = Color(0xf5f5f5f5);
  static Color darkbluish = Color(0xff403b58);

}