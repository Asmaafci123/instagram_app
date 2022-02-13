import 'package:flutter/material.dart';

import '../../size.dart';
Widget buildDivider(BuildContext context)
{
  return Container(
    height: getHeight(context)*0.0003,
    width: getWidth(context)*0.35,
    color: Colors.white,
  );
}