import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/Auth/login_auth/login_cubit.dart';
import 'package:intnstagram/Business_logic/Auth/login_auth/login_states.dart';
class CustomTextFormField extends StatelessWidget {
  late var onChanged;
  late final hintText;
  CustomTextFormField(
      {
        required this.hintText,
        required this.onChanged
      }
      );
  @override
  Widget build(BuildContext context) {
        return TextFormField(
          cursorColor: Colors.white,
          keyboardType:TextInputType.emailAddress,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: Colors.white
                  )
              )
          ),
          onChanged:onChanged
    );
  }
}
