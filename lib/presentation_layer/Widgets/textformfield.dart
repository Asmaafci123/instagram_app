import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/Auth/login_auth/login_cubit.dart';
import 'package:intnstagram/Business_logic/Auth/login_auth/login_states.dart';
class CustomTextFormField extends StatelessWidget {
  late final onChanged;
  late final hintText;
  late final validate;
  late final errorText;
  CustomTextFormField(
      {
        required this.hintText,
        required this.validate,
        required this.errorText,
      }
      );
  @override
  Widget build(BuildContext context) {
    return Container();
    //   //BlocConsumer<LoginCubit,LoginStates>(
    //   listener: (context,state){},
    //   builder: (context,state)
    //   {
    //     // return TextFormField(
    //     //     cursorColor: Colors.white,
    //     //     keyboardType: hintText==' password'||hintText==' Confirm password'?TextInputType.text:TextInputType.emailAddress,
    //     //     decoration: InputDecoration(
    //     //         fillColor: Colors.white,
    //     //         filled: true,
    //     //         hintText: hintText,
    //     //         errorText: validate==false?errorText:null,
    //     //         suffixIcon: hintText==' password'||hintText==' Confirm password'?Icon(Icons.remove_red_eye):null,
    //     //         border: OutlineInputBorder(
    //     //             borderRadius: BorderRadius.circular(15),
    //     //             borderSide: BorderSide(
    //     //                 color: Colors.white
    //     //             )
    //     //         )
    //     //     ),
    //     //   onChanged: (String value)
    //     //   {
    //     //     if(hintText==LoginCubit.get(context).email)
    //     //       {
    //     //         LoginCubit.get(context).email=value;
    //     //       }
    //     //     else
    //     //       {
    //     //         LoginCubit.get(context).password=value;
    //     //       }
    //     //   },
    //     // );
    //   },
    // );
  }
}
