

import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomStyles{

  TextStyle subtitleBold({
    color = CustomColors.orange,
    weight = FontWeight.w800,
    decoration = TextDecoration.none,
    fontSize = 16.0
  }){
    return TextStyle(
      color: color,
      decoration: decoration,
      fontSize: fontSize,
      fontWeight: weight,
    );
  }

  TextStyle normalBold({
    color = CustomColors.black,
    weight = FontWeight.w800,
    decoration = TextDecoration.none,
    fontStyle = FontStyle.normal,
    fontSize = 14.0
  }){
    return TextStyle(
        color: color,
        decoration: decoration,
        fontSize: fontSize,
        fontWeight: weight,
        fontStyle: fontStyle
    );
  }

  TextStyle normal({
    color = CustomColors.black,
    weight = FontWeight.w500,
    decoration = TextDecoration.none,
    fontStyle = FontStyle.normal,
    fontSize = 14.0
  }){
    return TextStyle(
        color: color,
        decoration: decoration,
        fontSize: fontSize,
        fontWeight: weight,
        fontStyle: fontStyle
    );
  }

}

CustomStyles styles = CustomStyles();