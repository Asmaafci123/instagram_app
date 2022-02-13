import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/App_Cubit/cubit.dart';
import 'package:intnstagram/Business_logic/App_Cubit/states.dart';
import 'package:intnstagram/Data_Layer/models/post_model.dart';
import 'package:intnstagram/Data_Layer/models/strory.dart';

import 'Widgets/post_item.dart';
import 'Widgets/storyitem.dart';
class TimeLineScreen extends StatelessWidget {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Story>storyList=[
      Story('assets/images/asmaa1.jpg','Asmaa'),
      Story('assets/images/asmaa1.jpg','Asmaa'),
      Story('assets/images/asmaa1.jpg','Asmaa'),
      Story('assets/images/asmaa1.jpg','Asmaa'),
      Story('assets/images/asmaa1.jpg','Asmaa'),
      Story('assets/images/asmaa1.jpg','Asmaa'),
    ];
    return SingleChildScrollView(
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Container(
                        height: 100,
                        child:ListView.separated(
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            itemBuilder:(context,index)=>buildStoryItem(storyList[index].imgPath!, storyList[index].profileName!,index),
                            separatorBuilder: (context,index)=>SizedBox(
                              width: 10,
                            ),
                            itemCount:storyList.length )
                    ),
                  ),
                  Divider(
                    indent: 0,
                    endIndent: 0,
                    thickness: 0.1,
                    color: Colors.grey,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: AppCubit.get(context).posts.length,
                    itemBuilder: (context, index) {
                      return PostItem(AppCubit.get(context).posts[index],"Asmaa S.");
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
