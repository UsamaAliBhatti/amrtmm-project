import 'package:flutter/material.dart';

Widget logo(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return Container(
    padding: const EdgeInsets.only(top: 27),
    alignment: Alignment.center,
    height: height * 0.23, // Adjust the height as needed
    child: Image.asset(
      'assets/images/logo.png',
      height: 200,
      width: 160,
    ),
  );
}
