import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intnstagram/Business_logic/App_Cubit/cubit.dart';
import 'package:intnstagram/Business_logic/App_Cubit/states.dart';
import 'package:intnstagram/Data_Layer/models/file.dart';
import 'package:intnstagram/presentation_layer/createPostScreen.dart';
import 'package:intnstagram/size.dart';
import 'package:storage_path/storage_path.dart';
class AddPostScreen extends StatefulWidget {
  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  List<FileModel>? files;
  FileModel? selectedModel;
  String? image;
  @override
  void initState() {
    super.initState();
    getAllImagesFromGallery();
  }
  void getAllImagesFromGallery()async
  {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath) as List;
    files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    if (files != null && files!.length > 0)
    {
      setState(() {
        selectedModel = files![0];
        image = files![0].files![0];
        AppCubit.get(context).changePostImage(image!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        builder: (context,state){
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
                'New post',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>CreatePostScreen()));
                  },
                  icon:  Image(
                    image: AssetImage("assets/icons/arrow_back.png"),
                    width: 35,
                    height: 35,
                    fit: BoxFit.cover,
                  ),)
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: getWidth(context),
                      height: 300,
                      color: Colors.white,
                        child:Image.file(File(image!),
                            height: MediaQuery.of(context).size.height * 0.45,
                            width: MediaQuery.of(context).size.width)

                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            'Gallery',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                  onPressed: (){

                                  },
                                  icon: Container(
                                    height: 30,
                                    width: 30,
                                    child: Image(
                                        image: AssetImage('assets/icons/gallery.png')
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                  onPressed: (){},
                                  icon: Image(
                                      image: AssetImage('assets/icons/camera.png')
                                  ),
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                    selectedModel == null &&selectedModel!.files!.length < 1
                    ? Container()
                    : Container(
                  width: getWidth(context),
                  height: getHeight(context) * 0.38,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3),
                      itemBuilder: (_, i) {
                        var file = selectedModel!.files![i];
                        return GestureDetector(
                          child: Image.file(
                            File(file),
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            setState(() {
                              image = file;
                            });
                          },
                        );
                      },
                      itemCount: selectedModel!.files!.length),
                )
                 ],
                ),
              ),
            ),
          );
        },
        listener:(context,state){});
  }
}
