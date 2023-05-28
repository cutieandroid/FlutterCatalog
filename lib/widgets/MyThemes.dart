import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {

  static ThemeData lighttheme(BuildContext context) =>

      ThemeData(
          canvasColor: creamcolor,
          cardColor: Colors.white,
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.black,
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

          canvasColor: darkcreamcolor,
          accentColor: Colors.white,
          primarySwatch: Colors.deepPurple,
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

  static Color creamcolor = Colors.grey.shade200;
  static Color darkcreamcolor = Colors.blueGrey.shade900;

  static Color darkbluish = Color(0xff403b58);
  static Color lightnbluish = Colors.purple.shade400;

}