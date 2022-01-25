import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'login_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(
        seconds: 3),
          (){
          Navigator.pushReplacementNamed(context, '/login');
          }
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 100,
                child: Image(
                  image: AssetImage('assets/logo/instagram.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
                child: Container(
                  width: 100,
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'from',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            child: Image(
                              image: AssetImage('assets/logo/meta.jpg'),
                            ),
                          ),
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: [
                                  Color(0xFF8F44A8),
                                  Color(0xFFD93F6F),
                                  Color(0xFFFA8F22)
                                ],
                                tileMode: TileMode.mirror,
                              ).createShader(bounds);
                            },
                            child: Text(
                              'Meta',
                              style: TextStyle(
                                  color:Color(0xFFD42F87),
                                fontSize: 20,
                               // fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
