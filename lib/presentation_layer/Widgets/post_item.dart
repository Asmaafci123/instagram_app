import 'package:flutter/material.dart';
import 'package:intnstagram/Data_Layer/models/post_model.dart';

class PostItem extends StatelessWidget {
  final String userName;
  final PostModel model;

  const PostItem(this.model, this.userName);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage('${model.profileImg}'),
                  radius: 25,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  '${model.userName}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                  ),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Image(
            width: screenWidth,
            height: screenWidth,
            fit: BoxFit.cover,
            image: NetworkImage('${model.postImg}'),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsetsDirectional.only(end: 16),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Image(
                          image: AssetImage("assets/icons/heart.png"),
                          fit: BoxFit.cover,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      margin: EdgeInsetsDirectional.only(end: 16),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Image(
                          image: AssetImage("assets/icons/comment.png"),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Image(
                          image: AssetImage("assets/images/dm.png"),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Image(
                          image: AssetImage("assets/images/archive.png"),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text("3,776 views"),
                ),
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "mhssn ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                          text:
                              "this is just test for the instagram comment and hi this is just test"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    "View all 23 comments",
                    style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage('${model.profileImg}'),
                        radius: 15,
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 8),
                        child: Text(
                          "Add Comment..",
                          style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    "3 days ago",
                    style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
