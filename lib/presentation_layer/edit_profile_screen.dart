import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/App_Cubit/cubit.dart';
import 'package:intnstagram/Business_logic/App_Cubit/states.dart';
import 'Widgets/textfieldforedit.dart';
class EditProfileScreen extends StatelessWidget {
String name='';
String userName='';
String bio='';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        var profileImage=AppCubit.get(context).profileImage;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon:  Image(
                image: AssetImage("assets/icons/cross.png"),
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),),
            title: Text(
              'Edit profile',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
            ),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {
                //  print(AppCubit.get(context).userModel!.name);
                 AppCubit.get(context).updateUserData(
                     name: name.isEmpty?AppCubit.get(context).userModel!.name!:name,
                     userName: userName.isEmpty?AppCubit.get(context).userModel!.userName!:userName,
                     bio: bio.isEmpty?AppCubit.get(context).userModel!.bio!:bio,
                     profileImage: AppCubit.get(context).userModel!.profileImg);
                  Navigator.pop(context);
                },
                icon:  Image(
                  image: AssetImage("assets/icons/done.png"),
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                ),)
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10,0,0),
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white10,
                      radius: 50.0,
                      backgroundImage:profileImage==null?NetworkImage('https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'):FileImage(profileImage)as ImageProvider,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10,0,0),
                  child: Center(
                    child: TextButton(
                      onPressed: () async{
                        await AppCubit.get(context).getProfileImage();
                        AppCubit.get(context).uploadProfileImage();
                      },
                      child: Text(
                        'Change profile photo',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 25,
                            fontWeight: FontWeight.w400
                        ),
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0,0),
                  child: TextFieldForEdit(
                      labelText: ' Name',
                      onChanged: (String value){name=value;},initialValue:AppCubit.get(context).userModel!.name),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0,0),
                  child: TextFieldForEdit(labelText: ' Username',onChanged: (String value){userName=value;},initialValue:AppCubit.get(context).userModel!.userName),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0,0),
                  child: TextFieldForEdit(labelText: ' Pronouns',onChanged: (String value){},),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0,0),
                  child: TextFieldForEdit(labelText: ' Website',onChanged: (String value){},),
                )
                ,
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0,0),
                  child: TextFieldForEdit(labelText: ' Bio',onChanged: (String value){bio=value;},initialValue:AppCubit.get(context).userModel!.bio
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
