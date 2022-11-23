import 'package:flutter/material.dart';

AppBar appBarMain(BuildContext context) {
  return AppBar(
    title: Image.asset(
      'assets/images/logo.png',
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
    focusedBorder: textFieldBorder(Colors.white),
    enabledBorder: textFieldBorder(Colors.white),
  );
}

TextStyle textfieldHintStyle() {
  return const TextStyle(color: Colors.white54);
}

UnderlineInputBorder textFieldBorder(Color borderColor) {
  return UnderlineInputBorder(
    borderSide: BorderSide(color: borderColor),
  );
}

Gradient myLinearGradient(bool sendByMe) {
  return LinearGradient(
    colors: sendByMe
        ? [const Color(0xff007EF4), const Color(0xff2A75BC)]
        : [const Color(0x1AFFFFFF), const Color(0x1AFFFFFF)],
  );
}

BorderRadius sendByMeBorderRadius() {
  return const BorderRadius.only(
      topLeft: Radius.circular(23),
      topRight: Radius.circular(23),
      bottomLeft: Radius.circular(23));
}

BoxDecoration sendByMeDecoration(bool sendByMe) {
  return BoxDecoration(
    borderRadius: sendByMe ? sendByMeBorderRadius() : sendByMeBorderRadius(),
    gradient: myLinearGradient(sendByMe),
  );
}

Text msgText(String? msg) {
  return Text(
    msg!,
    textAlign: TextAlign.start,
    style: const TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontFamily: 'OverpassRegular',
      fontWeight: FontWeight.w300,
    ),
  );
}

Container sendByMeContainer(bool sendByMe, String message) {
  return Container(
      margin: sendByMe ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
      padding: EdgeInsets.only(
        top: 17,
        bottom: 17,
        right: 20,
        left: 20,
      ),
      decoration: sendByMeDecoration(sendByMe),
      child: msgText(message));
}
