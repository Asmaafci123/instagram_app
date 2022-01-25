import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/Auth/login_auth/login_states.dart';
import 'package:intnstagram/Data_Layer/repositories/auth.dart';
class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit() : super(InitialLoginState());
  final AuthRepository _auth=AuthRepository.instance;
  static LoginCubit get(BuildContext context)=>BlocProvider.of(context);
  String email='';
  String password='';

  login(String email ,String password,) async {
    print(email);
    print(password);
    emit( LoadingLoginState());
    try {
      String uid = await _auth.login(email, password);
      //Navigator.pushReplacementNamed(context, "/home");
      print(uid);
      emit(SuccessLoginState());
    } on PlatformException catch (e) {
    print('exception');
      emit(FailedLoginState());
    }
  }

}
