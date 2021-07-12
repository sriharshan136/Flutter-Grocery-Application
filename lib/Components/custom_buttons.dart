import 'package:flutter/material.dart';
import 'package:grocery_application/Shared/colors.dart';

ElevatedButton customButton(String text, onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(text, style: TextStyle(color: white)),
    style: ElevatedButton.styleFrom(
      primary: primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  );
}

OutlinedButton customOutlineButton(String text, onPressed) {
  return OutlinedButton(
    onPressed: onPressed,
    child: Text(text, style: TextStyle(color: primaryColor)),
    style: OutlinedButton.styleFrom(
      primary: highlightColor,
      side: BorderSide(color: primaryColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  );
}
