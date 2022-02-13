import 'package:flutter/material.dart';
import 'package:intnstagram/size.dart';
class CustomButton extends StatelessWidget {
  late var onPressed;
  late final text;
  CustomButton(
  {
    required this.onPressed,
    required this.text
}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF4862CA),
          borderRadius: BorderRadius.circular(10)
      ),
      width: double.infinity,
      height: getHeight(context)*0.06,
      child: GestureDetector(
        onTap: onPressed,
        child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            )
        ),
      ),
    );
  }
}
