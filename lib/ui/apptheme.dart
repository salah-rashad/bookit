import 'package:flutter/material.dart';

//colors

const Color darkBlue = Color(0xff333E4A);
const Color lightBlue = Color(0xff899FB7);
const Color yellow = Color(0xffF5E51B);
const Color red = Color(0xFFE61D4F);
const Color grey1 = Color(0xffDADBDD);
const Color offWhite = Color(0xffF9F9F9);
const Color white = Color(0xffFFFFFF);
const Color awesome = Color(0xff00CFEF);
const Color f_logo_color = Color(0xFF1878f3);



ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: offWhite,
    primaryColor: grey1,
    accentColor: awesome,
    platform: TargetPlatform.iOS,
    fontFamily: 'Bahij'
);

class AppTextStyle extends TextStyle {
  final Color color;
  final double size;

  AppTextStyle({this.color = darkBlue, this.size = 14});

  TextStyle regular() {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle extraLight() {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w100,
    );
  }

  TextStyle semiLight() {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w200,
    );
  }

  TextStyle light() {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w300,
    );
  }

  TextStyle semiBold() {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle bold() {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle extraBold() {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w800,
    );
  }

  TextStyle black() {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w900,
    );
  }
}