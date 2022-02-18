import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intnstagram/Business_logic/App_Cubit/cubit.dart';
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
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData)
            {
              return Text('posts error');
            }
          else
            {
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
                        itemCount: snapshot.data!.size,
                        itemBuilder: (context, index) {
                          return PostItem(snapshot.data!.docs[index],"Asmaa S.");
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
        },
      ),
    );
  }
}


