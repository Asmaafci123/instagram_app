import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  late final onPressed;
  late final text;
  CustomButton(
  {
    this.onPressed,
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
      height: 45,
      child: GestureDetector(
        onTap: ()=>onPressed,
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
