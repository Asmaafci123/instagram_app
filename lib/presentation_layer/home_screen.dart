import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intnstagram/Data_Layer/models/strory.dart';
import 'Widgets/post_item.dart';
import 'Widgets/storyitem.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth:0,
        titleSpacing: 16,
        title: Image(
          image:AssetImage('assets/logo/instagram_font.png'),
          height: 40,
          fit: BoxFit.cover,
          width: 100,
        ),
       centerTitle: false,
        actions: [
          IconButton(
            icon: Image(
              image: AssetImage("assets/icons/add_post.png"),
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image(
              image: AssetImage("assets/icons/like.png"),
              width: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image(
              image: AssetImage("assets/images/dm.png"),
              width: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body:SingleChildScrollView(
        child: Container(
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
                          itemCount: 100,
                          itemBuilder: (context, index) {
                            return PostItem("Asmaa S.", "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1001&q=80");
                          },
                      ),
                  ],
                ),
              ),
            ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: index,
          onTap: (int index) { setState((){ this.index = index; }); },
          items: [
            BottomNavigationBarItem(
              title: Text(""),
                icon: IconButton(
                  icon: Image(
                    image: AssetImage("assets/icons/home.png"),
                    width: 24,
                  ),
                  onPressed: () {},
                ),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: Image(
                  image: AssetImage("assets/icons/search.png"),
                  width: 24,
                ),
                onPressed: () {},
              ),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: Image(
                  image: AssetImage("assets/icons/add_post.png"),
                  width: 24,
                ),
                onPressed: () {},
              ),
            ),

            BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: Image(
                  image: AssetImage("assets/icons/like.png"),
                  width: 24,
                ),
                onPressed: () {},
              ),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: Image(
                  image: AssetImage("assets/icons/profile.png"),
                  width: 24,
                ),
                onPressed: () {},
              ),
            ),
          ],

        ),
      ),
    );
  }
}
/*
Container(
                    color: Colors.white,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Image(
                            image: AssetImage("assets/icons/home.png"),
                            width: 24,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image(
                            image: AssetImage("assets/icons/search.png"),
                            width: 24,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image(
                            image: AssetImage("assets/icons/add_post.png"),
                            width: 24,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image(
                            image: AssetImage("assets/icons/like.png"),
                            width: 24,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image(
                            image: AssetImage("assets/icons/profile.png"),
                            width: 24,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
 */
