
import 'package:flutter/material.dart';

Widget buttonCalc({
  required String text,
  required Function() event,
  Color buttonColor = Colors.white10,
  Color textColor = Colors.white
}) =>
    Padding(
      padding: const EdgeInsets.all(6.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
          ),
          onPressed: event,
          child: Text(text, style: TextStyle(fontSize: 40, color: textColor))),
    );

// Colors.deepOrange for operation
//