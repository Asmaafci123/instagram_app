import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/App_Cubit/cubit.dart';
import 'package:intnstagram/Business_logic/App_Cubit/states.dart';
import 'package:intnstagram/presentation_layer/home_screen.dart';
import 'package:intnstagram/size.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController postText = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image(
                image: AssetImage("assets/icons/cross.png"),
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              'New post',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {
                  AppCubit.get(context).uploadImagePost(
                      text: postText.text, postTime: DateTime.now().toString());
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>HomeScreen()));
                },
                icon: Image(
                  image: AssetImage("assets/icons/arrow_back.png"),
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: postText,
                          decoration: InputDecoration(
                              hintText: 'what is on your mind...',
                              border: InputBorder.none),
                        ),
                      ),
                    SizedBox(
                      width: getWidth(context),
                      height: getHeight(context) * 0.5,
                      child: Container(
                        child: Image.file(File(AppCubit.get(context).image!),fit: BoxFit.fill,),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
