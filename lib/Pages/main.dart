import 'package:catalog/Pages/Cart.dart';
import 'package:catalog/utils/MyRoutes.dart';
import 'package:catalog/widgets/MyThemes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:catalog/Pages/homepage.dart';
import 'package:catalog/Pages/login.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lighttheme(context),
      darkTheme: MyTheme.darktheme(context),
      //instead of doing the below stuf we created seprate themes class for better managing the themes
      // themeMode: ThemeMode.dark,
      //thememode.dark requires dark theme and themedata
      /* theme: ThemeData(primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black ),
              titleTextStyle: TextStyle(color:Colors.black,fontSize: 20)


          )
      ),*/
      /*  darkTheme: ThemeData(
                 brightness: Brightness.dark
      ),*/
      routes: {
        "/": (context) => Homepage(),
        MyRoutes.loginroute: (context) => login(),
        MyRoutes.homeroute: (context) => Homepage(),
        MyRoutes.cartroute:(context)=> Cart()
      },
    );
  }
}
