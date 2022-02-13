import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/Auth/signUp_auth/signup_cubit.dart';
import 'package:intnstagram/Business_logic/Auth/signUp_auth/signup_states.dart';
import 'package:intnstagram/Data_Layer/repositories/auth.dart';
import '../size.dart';
import 'Widgets/button.dart';
import 'Widgets/divider.dart';
import 'Widgets/textButton.dart';
import 'Widgets/textformfield.dart';
import 'login_screen.dart';
class SignUpScreen extends StatefulWidget {
  final AuthRepository _auth = AuthRepository.instance;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email='';
  String password='';
  String phone='';
  String name='';
  String userName='';
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=>SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                        width: getWidth(context),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xFF4862CA),
                                Color(0xFFC837AB),
                              ],
                            )
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Instagram',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'TheNautigal'
                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
                              child: CustomTextFormField(
                                hintText: ' Email',
                                onChanged:(String value){
                                  email=value.toString().trim();
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                              child: CustomTextFormField(
                                hintText: ' Full name',
                                onChanged:(String value){
                                  name=value;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                              child: CustomTextFormField(
                                hintText: ' Username',
                                onChanged:(String value){
                                  userName=value;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                              child: CustomTextFormField(
                                hintText: ' phone',
                                onChanged:(String value){
                                  phone=value.toString().trim();
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                              child: CustomTextFormField(
                                hintText: ' password',
                                onChanged:(String value){
                                  password=value.toString().trim();
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                              child: CustomTextFormField(
                                hintText: ' Confirm password',
                                onChanged:(String value){},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
                              child: CustomButton(
                                  text: 'Sign Up',
                                  onPressed: (){
                                    SignUpCubit.get(context).signUp(
                                      email,
                                      name,
                                      userName,
                                      phone,
                                      password,
                                      context
                                    );
                                  }
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: getHeight(context)*0.03,
                                  width: getWidth(context)*0.05,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/logo/facebook_logo.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: getWidth(context)*0.01,
                                ),
                                Text(
                                  'Log in with facebook',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: getHeight(context)*0.015,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 20, 20, 10),
                              child: Row(
                                children: [
                                  buildDivider(context),
                                  SizedBox(
                                    width: getWidth(context)*0.035,
                                  ),
                                  Text(
                                    'OR',
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(
                                    width: getWidth(context)*0.035,
                                  ),
                                  buildDivider(context)
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account ?',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                buildTextButton(
                                    'Log in',
                                        () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    })
                              ],
                            ),
                          ],
                        )
                    ),
                  ),
                )
            );
          }
      ),

    );

  }
}
