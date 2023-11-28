import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Palette {
  static const darkBlueBackground = Color(0XFF060027);

  static const dullWhite = Color(0XFFFCFCFC);

  static const dullerWhite = Color(0XFFD9D9D9);

  static const chatTextboxBackground = Color(0XFF2D2946);

  static const incomingMessage = Color(0XFF038597);
  static const outgoingMessage = Color(0XFF0E4E72);

  static const messagesAppBar = Color(0XFF111F4B);

  static const darkBottomNavBackground = Color(0XFF000C34);
  static const darkBottomNavActive = Color(0XFF03ABCE);

  static const grayTextColor = Color(0XFFC3C2C2);
  static const white = Color(0XFFFFFFFF);
  static const darkBlueText = Color(0XFF070033);

  static const logoutRed = Color(0XFFDC556B);

  // static const darkBlueBackground = Color(0XFF060027);
  // 1946BB //tagBlue
  // 15C69B //tagGreen
  // F36D21 //tagOrange
  // 0F7D9F // tagOrangish
  // E19C7A //tagLightorange
  // AD15C6 //tagPurple
  // 064279 //tagBlueish
  // 5F11C2 //tagPurplish
  // 1946BB //tagSomebluish
  // 089A6E // tagGreenbutton
  static const tabBlue = Color(0XFF1946BB);
  static const tagGreen = Color(0XFF15C69B);
  static const tagOrange = Color(0XFFF36D21);
  static const tagblu = Color(0XFF0F7D9F);
  static const tagLightorange = Color(0XFFE19C7A);
  static const tagPurple = Color(0XFFAD15C6);
  static const tagBlueish = Color(0XFF064279);
  static const tagPurplish = Color(0XFF5F11C2);
  static const tagSomebluish = Color(0XFF1946BB);
  static const tagGreenbutton = Color(0XFF089A6E);
  static const tagPalette = [
    tabBlue,
    tagGreen,
    tagOrange,
    tagblu,
    tagLightorange,
    tagPurple,
    tagBlueish,
    tagPurplish,
    tagSomebluish,
    tagGreenbutton
  ];

  static const transparent = Colors.transparent;

  static const black = Colors.black;

  static var appBackground = Color.fromRGBO(123, 80, 231, 1.0) ;

  static randomTagColor() {
    Random random = Random();
    var color = tagPalette[random.nextInt(tagPalette.length)];
    return color;
  }

  // static const tagSomebluish = Color(0XFF070033);
  // static const tagSomebluish = Color(0XFF070033);
  // static const tagSomebluish = Color(0XFF070033);
}
