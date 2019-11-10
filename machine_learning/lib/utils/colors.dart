import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
 static Color defaultColor = Color(0xff252935);
 static Color minimalColor = Color(0xff1BD6EB);
 static Color secondaryColor = Color(0xff57616f);
 static String chartSecondaryColor = "#57616f";


 HSLColor makeColor(int colorIndex, double colorNumber, double colorSaturation,
     double colorBrightness) {
  if (colorNumber < 1) colorNumber = 1;
  double colorValue = (colorIndex * (360 / colorNumber)) % 360;

  return HSLColor.fromAHSL(1.0, colorValue, colorSaturation, colorBrightness);
 }
  }
