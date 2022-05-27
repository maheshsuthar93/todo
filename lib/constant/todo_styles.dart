import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle styleRegular =
    GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.w400);

final TextStyle styleBold =
    GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.w700);

final TextStyle styleSemiBold =
    GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.w600);

final TextStyle styleExtraBold =
    GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.w800);

final TextStyle styleMedium =
    GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.w500);

const Color primary = const Color(0xff4653a1);
const Color secondary = const Color(0xff27bdef);
const Color hintColor = const Color.fromRGBO(0, 0, 0, .2);
const Color colorPlaceholder = const Color(0xffE9E9E9);
const Color colorDot = const Color(0xff6F6F6F);
const Color colorLine = const Color(0xffB9B9B9);
const Color colorDivider = const Color(0xffEFEFF4);

Map<int, Color> color = {
  50: Color.fromRGBO(70, 83, 161, .1),
  100: Color.fromRGBO(70, 83, 161, .2),
  200: Color.fromRGBO(70, 83, 161, .3),
  300: Color.fromRGBO(70, 83, 161, .4),
  400: Color.fromRGBO(70, 83, 161, .5),
  500: Color.fromRGBO(70, 83, 161, .6),
  600: Color.fromRGBO(70, 83, 161, .7),
  700: Color.fromRGBO(70, 83, 161, .8),
  800: Color.fromRGBO(70, 83, 161, .9),
  900: Color.fromRGBO(70, 83, 161, 1),
};
