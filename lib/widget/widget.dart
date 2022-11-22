import 'package:flutter/material.dart';

Widget appBarMain() {
  return AppBar(
    title: Image.asset(
      'asset/images/logo.png',
      height: 40,
    ),
    elevation: 0.0,
    centerTitle: false,
  );
}

InputDecoration textfieldInputDecoration(String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    hintStyle: textfieldHintStyle(),
    focusedBorder: myborder(),
    enabledBorder: myborder(),
  );
}

TextStyle textfieldHintStyle() {
  return const TextStyle(color: Colors.white54);
}

UnderlineInputBorder myborder() {
  return const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  );
}
