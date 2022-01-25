import 'package:flutter/material.dart';
Widget buildStoryItem(String imgPath,String profileName,int index)
{
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Stack(
        alignment:  Alignment.bottomRight,
       children: [
         Container(
           width: 70,
           height: 70,
           decoration: BoxDecoration(
             shape: BoxShape.circle,
             border: Border.all(color: Color(0xFFC837AB)),
             image: DecorationImage(
                 image: AssetImage(imgPath),
                 fit: BoxFit.cover
             ),
           ),
         ),
         if(index==0)
         CircleAvatar(
           backgroundColor: Colors.blue,
           radius: 9,
           child: Image(
               image: AssetImage('assets/images/plus.png'),
             ),
         ),
       ],
      ),
      SizedBox(
        height: 5,
      ),
      Text(profileName),
    ],
  );
}