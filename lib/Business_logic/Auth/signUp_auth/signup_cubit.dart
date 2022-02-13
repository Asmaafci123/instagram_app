import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/Auth/signUp_auth/signup_states.dart';
import 'package:intnstagram/Data_Layer/repositories/auth.dart';
import 'package:intnstagram/presentation_layer/home_screen.dart';
import 'package:intnstagram/presentation_layer/login_screen.dart';
class SignUpCubit extends Cubit<SignUpStates>
{
  SignUpCubit() : super(InitialSignUpState());
  final AuthRepository _auth=AuthRepository.instance;
  static SignUpCubit get(BuildContext context)=>BlocProvider.of(context);

  signUp(String email ,String name,String userName,String password,String phone,BuildContext context) async {
    try {
      String uId =await _auth.signUp(email, password);
     await  _auth.createUser(email, name,userName, password, uId, phone);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context)=>LoginScreen()));
      debugPrint(uId);
      emit(SuccessSignUpState());
    } on PlatformException catch (e) {
      print('exception');
      emit(FailedSignUpState());
    }
  }

}
