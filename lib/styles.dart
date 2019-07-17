import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class Styles {

  static const logoText = TextStyle(
    fontFamily: 'Jura',
    fontWeight: FontWeight.w600,
    fontSize: 30.0,
  );

  static const appBarTitle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17.0,
  );

  static const appBarSubtitle = TextStyle(
    color: grey800,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
    fontSize: 13.0,
  );

  static const headerText = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 20.0,
  );

  static const captionText = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 15.0,
  );

  static const codeText = TextStyle(
    fontFamily: 'Jura',
    fontWeight: FontWeight.w600,
    fontSize: 32.0,
    letterSpacing: 4.0,
  );

  static const codeHint = TextStyle(
    color: Styles.grey300,
  );

  static const inputText = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
  );

  static const disabledInputText = TextStyle(
    color: grey500,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
  );

  static const inputLabelText = TextStyle(
    color: grey500,
    fontWeight: FontWeight.w400,
  );

  static const inputLabelSmallText = TextStyle(
    color: grey500,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    height: 0.8,
  );

  static const listHeaderText = TextStyle(
    color: grey500,
  );

  static const detailTitleText = TextStyle(
    color: Colors.black,
    fontSize: 17.0,
  );

  static const detailDescriptionText = TextStyle(
    color: grey500,
    fontSize: 15.0,
    letterSpacing: -0.41,
    height: 1.3,
  );

  static const detailSubtitleText = TextStyle(
    color: grey800,
    letterSpacing: -0.41,
    fontSize: 15.0,
    height: 1.3,
  );

  static const conditionsText = TextStyle(
    color: grey800,
    fontSize: 15.0,
  );

  static const conditionsSelectedText = TextStyle(
    color: Colors.white,
    fontSize: 15.0,
  );

  static const buttonText = TextStyle(
    color: Colors.white,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
    fontFamily: "Open Sans",
    fontSize: 15,
  );

  static const inputPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 13.0,
  );

  static const inputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: grey200),
  );

  static const inputBoxBorder = Border(
    bottom: BorderSide(color: grey200),
  );

  static const penIcon = Icon(
    FontAwesomeIcons.pen,
    size: 14.0,
    color: grey500,
  );

  static const plusIcon = Icon(
    FontAwesomeIcons.plusCircle,
    size: 24.0,
    color: trifidBlue,
  );

  static const trifidBlue = Color(0xff3096d6);
  static const grey800 = Color(0xff50555c);
  static const grey500 = Color(0xff888888);
  static const grey300 = Color(0xFFCECECE);
  static const grey200 = Color(0xffe9e9e9);
}
