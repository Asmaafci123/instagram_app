import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/Auth/login_auth/login_cubit.dart';
import 'package:intnstagram/Business_logic/Auth/login_auth/login_states.dart';
import 'package:intnstagram/presentation_layer/register_screen.dart';
import 'package:intnstagram/size.dart';
import '../cache_helper.dart';
import 'Widgets/button.dart';
import 'Widgets/divider.dart';
import 'Widgets/textButton.dart';
import 'Widgets/textformfield.dart';
import 'home_screen.dart';
class LoginScreen extends StatelessWidget {

  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) =>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if(state is SuccessLoginState)
            {
              CacheHelper.saveData(key: 'uId', value: state.uId).
              then((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              });
            }
        },
        builder: (context,state){
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                    width: getWidth(context),
                    height:getHeight(context),
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
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Hero(
                          tag: 5,
                          child:  Text(
                            'Instagram',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'TheNautigal'
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(30, 40, 30,0),
                            child:CustomTextFormField(
                              hintText: ' Email',
                              onChanged:(String value){
                                email=value.toString().trim();
                              },)
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30,20),
                            child:CustomTextFormField(
                              hintText: ' password',
                              onChanged:(String value){
                                password=value.toString().trim();
                              },)
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30,40),
                            child: CustomButton(
                                text: 'Log in',
                                onPressed:(){
                                  LoginCubit.get(context).login(email,password,context);
                                })
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: getHeight(context)*0.03,
                              width: getWidth(context)*0.05,
                              child: Image(
                                image: AssetImage('assets/logo/facebook_logo.png'),
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
                              'Don\'t have an account?',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            buildTextButton('Sign Up',(){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>SignUpScreen()));
                            })
                          ],
                        ),
                      ],
                    )
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}

