import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/App_Cubit/cubit.dart';
import 'package:intnstagram/Business_logic/App_Cubit/states.dart';
import 'package:intnstagram/presentation_layer/edit_profile_screen.dart';
import 'package:intnstagram/size.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var userModel=AppCubit.get(context).userModel;
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20,10,10,10),
                    child: Row(
                      children: [
                        Text(
                          '${userModel!.name}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              onPressed: (){},
                              icon:  Image(
                                image: AssetImage("assets/icons/add.png"),
                                width:getWidth(context)*0.1,
                                height: getHeight(context)*0.1,
                                fit: BoxFit.cover,
                              ),),
                            IconButton(
                              onPressed: (){},
                              icon:  Image(
                                image: AssetImage("assets/icons/menu.png"),
                                width: getWidth(context)*0.1,
                                height: getHeight(context)*0.1,
                                fit: BoxFit.cover,
                              ),)
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10,0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius:getWidth(context)*0.15,
                          backgroundImage:NetworkImage('${userModel.profileImg}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
                          child: InkWell(
                            onTap: (){},
                            child: Column(
                              children: [
                                Text('3',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                Text('Posts',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      // fontWeight: FontWeight.bold
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10,0),
                          child: InkWell(
                            onTap: (){},
                            child: Column(
                              children: [
                                Text('94',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                Text('Followe...',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      // fontWeight: FontWeight.bold
                                    )),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Column(
                            children: [
                              Text('149',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              Text('Following',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    // fontWeight: FontWeight.bold
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20,0, 0),
                    child: Text(
                      '${userModel.userName}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10,0, 0),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: AppCubit.get(context).userModel!.bio,
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                              text:'...more'
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,10, 5,0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey,width: 0.5),
                          ),
                          width: 300,
                          height: 45,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=>EditProfileScreen()));
                            },
                            child: Center(
                                child: Text(
                                  'Edit profile',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,10, 20,0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey,width: 0.5),
                          ),
                          width: 45,
                          height: 45,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=>EditProfileScreen()));
                            },
                            child: IconButton(
                              icon: Icon(Icons.keyboard_arrow_down_rounded),
                              onPressed: () {  },)
                            ),
                          ),
                        ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
