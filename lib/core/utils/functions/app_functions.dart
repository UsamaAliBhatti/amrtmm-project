import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

showToast({required String? msg, Toast? toastLength}) {
  if (msg == null || msg.isEmpty) return;
  Fluttertoast.showToast(
    msg: msg,
    toastLength: toastLength ?? Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

DateTime? parseDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) return null;

  List<String> formats = [
    "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ",
    "yyyy-MM-dd HH:mm:ss"
  ];

  for (var format in formats) {
    try {
      return DateFormat(format).parse(dateString, true);
    } catch (_) {}
  }

  return null;
}
