import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const inputText = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
  );

  static const inputLabelText = TextStyle(
    color: Color(0xff888888),
    fontWeight: FontWeight.w400,
  );

  static const inputLabelSmallText = TextStyle(
    color: Color(0xff888888),
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    height: 0.8,
  );

  static const detailCardTitle = TextStyle(
    color: Colors.black,
    letterSpacing: -0.41,
    fontSize: 17.0,
  );

  static const detailCardSubtitle = TextStyle(
    color: Color(0xff50555c),
    letterSpacing: -0.41,
    fontSize: 15.0,
    height: 1.3,
  );

  static const inputPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 13.0,
  );

  static const inputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xffe9e9e9)),
  );

  static const inputBoxBorder = Border(
    bottom: BorderSide(color: Color(0xffe9e9e9)),
  );

  static const trifidBlue = Color(0xff3096d6);
}
