import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/App_Cubit/cubit.dart';
import 'package:intnstagram/Business_logic/App_Cubit/states.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intnstagram/presentation_layer/pickPostImage_screen.dart';

import '../size.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appCubit.currentIndex == 0
              ? AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leadingWidth: 0,
                  titleSpacing: getWidth(context)*0.04,
                  title: Image(
                    image: AssetImage('assets/logo/instagram_font.png'),
                    height: getHeight(context)*0.05,
                    fit: BoxFit.cover,
                    width:getWidth(context)*0.33,
                  ),
                  centerTitle: false,
                  actions: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        customItemsIndexes: const [4],
                        customItemsHeight: 1,
                        itemPadding: const EdgeInsets.only(left: 16, right: 16),
                        dropdownWidth: 130,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        offset: const Offset(0, 8),
                          icon: Image(
                            image: AssetImage("assets/icons/add.png"),
                            width: getWidth(context)*0.1,
                            height: getHeight(context)*0.05,
                          ),
                          items: [
                            DropdownMenuItem(
                                value:'create post' ,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        'Post',style:TextStyle(fontWeight: FontWeight.w400)),
                                    Container(
                                      width:getWidth(context)*0.05,
                                      height:getHeight(context)*0.025 ,
                                      child: Image(
                                        image: AssetImage("assets/images/post.png"),
                                      ),
                                    ),
                                  ],
                                )),
                            DropdownMenuItem(
                                value:'add story' ,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Story'),
                                    Container(
                                      width:getWidth(context)*0.05,
                                      height:getHeight(context)*0.025 ,
                                      child: Image(
                                        image: AssetImage("assets/images/add_story.png"),
                                      ),
                                    ),
                                  ],
                                )),
                            DropdownMenuItem(
                                value:'add reel' ,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Reel'),
                                    Container(
                                      width:getWidth(context)*0.05,
                                      height:getHeight(context)*0.025,
                                      child: Image(
                                        image: AssetImage("assets/images/reel.png"),
                                      ),
                                    ),
                                  ],
                                )),
                            DropdownMenuItem(
                                value:'add live' ,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Live'),
                                    Container(
                                      width:getWidth(context)*0.05,
                                      height:getHeight(context)*0.025 ,
                                      child: Image(
                                        image: AssetImage("assets/images/live.png"),
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        onChanged: (value){
                          switch(value)
                          {
                            case 'create post':
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>AddPostScreen()));
                              AppCubit.get(context).getAllImagesFromGallery();
                              break;
                          }
                        },
                      ),
                    ),
                    IconButton(
                      icon: Image(
                        image: AssetImage("assets/icons/heart.png"),
                        width:getWidth(context)*0.1,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image(
                        image: AssetImage("assets/images/dm.png"),
                        width: getWidth(context)*0.065,
                      ),
                      onPressed: () {},
                    ),
                  ],
                )
              : null,
          body: appCubit.screens[appCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            currentIndex: appCubit.currentIndex,
            onTap: (index) {
              appCubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                title: Text(""),
                icon: appCubit.currentIndex == 0
                    ? Image.asset(
                        "assets/icons/filled_home.png",
                        width: getWidth(context)*0.07,
                        fit: BoxFit.cover,
                        height: getHeight(context)*0.04,
                      )
                    : Image.asset(
                        "assets/icons/home.png",
                        width: getWidth(context)*0.07,
                        height:  getHeight(context)*0.04,
                        fit: BoxFit.cover,
                      ),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: appCubit.currentIndex == 1
                    ? Image.asset(
                        "assets/icons/filled_search.png",
                        width: getWidth(context)*0.07,
                        height: getHeight(context)*0.04,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/icons/search.png",
                        width: getWidth(context)*0.07,
                  height: getHeight(context)*0.04,
                        fit: BoxFit.cover,
                      ),
              ),
              BottomNavigationBarItem(
                  title: Text(""),
                  icon: appCubit.currentIndex == 2
                      ? Image.asset(
                          "assets/icons/filled_videos.png",
                    width: getWidth(context)*0.07,
                    height: getHeight(context)*0.04,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assets/icons/videos.png",
                    width: getWidth(context)*0.07,
                    height: getHeight(context)*0.04,
                          fit: BoxFit.cover,
                        )),
              BottomNavigationBarItem(
                title: Text(""),
                icon: appCubit.currentIndex == 3
                    ? Image.asset(
                        "assets/icons/filled_bag.png",
                  width: getWidth(context)*0.07,
                        fit: BoxFit.cover,
                  height: getHeight(context)*0.04,
                      )
                    : Image.asset(
                        "assets/icons/bag.png",
                  width: getWidth(context)*0.07,
                        fit: BoxFit.cover,
                  height: getHeight(context)*0.04,
                      ),
              ),
              BottomNavigationBarItem(
                title: Text(""),
                icon: appCubit.currentIndex == 4
                    ? Image.asset(
                        "assets/icons/filled_avatar.png",
                  width: getWidth(context)*0.07,
                        fit: BoxFit.cover,
                  height: getHeight(context)*0.04,
                      )
                    : Image.asset(
                        "assets/icons/avatar.png",
                  width: getWidth(context)*0.07,
                        fit: BoxFit.cover,
                  height: getHeight(context)*0.04,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
