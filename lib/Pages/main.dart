import 'package:catalog/utils/MyRoutes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:catalog/Pages/homepage.dart';
import 'package:catalog/Pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      //thememode.dark requires dark theme and themedata
      theme: ThemeData(primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily
      ),
      /*  darkTheme: ThemeData(
                 brightness: Brightness.dark
      ),*/
      routes: {
        "/":(context)=> Homepage(),
        MyRoutes.loginroute: (context) => login(),
        MyRoutes.homeroute:(context)=> Homepage()
      },
    );
  }
}
