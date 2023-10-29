import 'package:flutter/material.dart';

TextButton buildTextButton(String text, Color backgroundColor, void Function() onPressed, {Icon? icon}) {
  return TextButton(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      minimumSize: const Size(double.infinity, 100),
      textStyle: const TextStyle(
        fontSize: 20.00
      )
    ),
    onPressed: onPressed,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (icon != null) icon,
        SizedBox(width: icon != null ? 8.0 : 0), 
        Text(text),
      ],
    )
  );
}
