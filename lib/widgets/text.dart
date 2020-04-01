import 'package:flutter/material.dart';

Text text(
  String texto, {
  double fontSize = 16,
  color = Colors.lightBlueAccent,
  bold = false,
}) {
  return Texst(
    texto ?? '',
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    ),
  );
}
