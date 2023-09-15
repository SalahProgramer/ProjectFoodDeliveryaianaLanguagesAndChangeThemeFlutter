import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeClass {
  Color lightPrimaryColor = HexColor('#DF0054');
  Color darkPrimaryColor = HexColor('#480032');
  Color secondaryColor = HexColor('#FF8B6A');
  Color accentColor = HexColor('#FFD2BB');

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    splashColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    hintColor: Colors.black45,
bottomNavigationBarTheme: BottomNavigationBarThemeData(

  selectedIconTheme: IconThemeData(
    color: Colors.white,
  )
),

    iconTheme: IconThemeData(
        color: Colors.black


    ),
    appBarTheme: AppBarTheme(



      shadowColor: Colors.blue,
      elevation: 9,
      color: Colors.white,

    ),
    hoverColor: Colors.black,
    cardColor: Colors.yellow,


  );


  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    hintColor: Colors.white60,
    splashColor: Colors.white60,


   cardColor: Colors.red,
    iconTheme: IconThemeData(
        color: Colors.white


      ),
      appBarTheme: AppBarTheme(



          shadowColor: Colors.blue,
          elevation: 9,
          color: Colors.black
      ),
    hoverColor: Colors.white,



  );
}

ThemeClass _themeClass = ThemeClass();