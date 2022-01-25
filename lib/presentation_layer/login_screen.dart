import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/Auth/login_auth/login_cubit.dart';
import 'package:intnstagram/Business_logic/Auth/login_auth/login_states.dart';
import 'package:intnstagram/presentation_layer/register_screen.dart';
import 'Widgets/button.dart';
import 'Widgets/divider.dart';
import 'Widgets/textButton.dart';
import 'Widgets/textformfield.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // TextEditingController emailController=TextEditingController();
  // TextEditingController passwordController=TextEditingController();
  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener:  (context,state){
        },
        builder: (context,state)
        {
          return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                    child: Container(
                        width: double.infinity,
                        height: MediaQuery. of(context). size. height,
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
                              padding: const EdgeInsets.fromLTRB(30, 40, 30,0),
                              child:TextFormField(
                                cursorColor: Colors.white,
                                keyboardType:TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: ' Email',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.white
                                        )
                                    )
                                ),
                                onChanged: (String value)
                                {
                                  email=value;
                                },
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 30,20),
                              child:TextFormField(
                                cursorColor: Colors.white,
                                keyboardType:TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: ' password',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.white
                                        )
                                    )
                                ),
                                onChanged: (String value)
                                {
                                  password=value;
                                },
                              )
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30,40),
                              child: CustomButton(
                                  text: 'Log in',
                                  onPressed: LoginCubit.get(context).login(
                                    email,
                                    password,
                                      )
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Image(
                                    image: AssetImage('assets/logo/facebook_logo.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
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
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 20, 20, 10),
                              child: Row(
                                children: [
                                  buildDivider(),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'OR',
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  buildDivider()
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
