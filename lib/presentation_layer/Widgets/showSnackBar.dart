import 'package:flutter/material.dart';

showSnackBar(String message, GlobalKey<ScaffoldState> scaffoldKey) {
  scaffoldKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}