import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/Auth/signUp_auth/signup_states.dart';
import 'package:intnstagram/Data_Layer/repositories/auth.dart';
import 'package:intnstagram/presentation_layer/Widgets/showSnackBar.dart';
class SignUpCubit extends Cubit<SignUpStates>
{
  SignUpCubit() : super(InitialSignUpState());
  final AuthRepository _auth=AuthRepository.instance;
  static SignUpCubit get(BuildContext context)=>BlocProvider.of(context);

  signUp(String email ,String password) async {
    try {
      String uid =await _auth.signUp(email, password);
      debugPrint(uid);
      emit(SuccessSignUpState());
    } on PlatformException catch (e) {
      print('exception');
      emit(FailedSignUpState());
    }
  }
}
