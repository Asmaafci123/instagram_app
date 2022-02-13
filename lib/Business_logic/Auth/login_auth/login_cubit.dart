import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/Auth/login_auth/login_states.dart';
import 'package:intnstagram/Data_Layer/repositories/auth.dart';
import 'package:intnstagram/presentation_layer/home_screen.dart';
class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit() : super(InitialLoginState());
  static LoginCubit get(BuildContext context)=>BlocProvider.of(context);
  AuthRepository _auth=AuthRepository.instance;
  login(String email ,String password,context) async {
    print(email);
    print(password);
    try {
      String uId = await _auth.login(email, password);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context)=>HomeScreen()));
      print(uId);
      emit(SuccessLoginState(uId));
    } on PlatformException catch (e) {
      print('exception');
      emit(FailedLoginState());
    }
  }

}
