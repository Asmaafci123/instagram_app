import 'package:flutter/material.dart';
Widget buildTextButton(String child,void Function() callback)
{
  return TextButton(
      onPressed: callback,
      child: Text(
        child,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ));
}