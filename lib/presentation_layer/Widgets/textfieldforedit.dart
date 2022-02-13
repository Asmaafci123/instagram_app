import 'package:flutter/material.dart';

class TextFieldForEdit extends StatelessWidget {
  late var onChanged;
  late final labelText;
  late final initialValue;
  TextFieldForEdit( {
    this.onChanged,
    this.labelText,
    this.initialValue
});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w400
      ),
      keyboardType:TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color(0xFF7F7F7F7F),
          fontSize: 25,
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}
