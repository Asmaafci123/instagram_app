import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intnstagram/Business_logic/App_Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:intnstagram/Data_Layer/models/file.dart';
import 'package:intnstagram/Data_Layer/models/post_model.dart';
import 'package:intnstagram/Data_Layer/models/user_model.dart';
import 'package:intnstagram/presentation_layer/profile_screen.dart';
import 'package:intnstagram/presentation_layer/search_screen.dart';
import 'package:intnstagram/presentation_layer/shop_screen.dart';
import 'package:intnstagram/presentation_layer/time_line_screen.dart';
import 'package:intnstagram/presentation_layer/vedios.dart';
import 'package:storage_path/storage_path.dart';
import '../../constants.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);
  UserModel? userModel;
  void getUserData()async
  {
    emit(LoadingGetUserState());
    await FirebaseFirestore.instance.
    collection('users').
    doc(uId).get().
    then((value) {
      userModel=UserModel.fromJson(value.data()!);
      print(userModel!.profileImg);
      emit(SuccessGetUserState());
    }).
    catchError((error){
      emit(FailedGetUserState(error.toString()));
    });
  }
  int currentIndex=0;
  List<Widget>screens=[
    TimeLineScreen(),
    SearchScreen(),
    VideosScreen(),
    ShoppingScreen(),
    ProfileScreen(),
  ];
  void changeBottomNav(int index)
  {
        currentIndex=index;
        emit(ChangeBottomNavState());
  }

  File? profileImage;
  final picker=ImagePicker();//open camera or gallary
  Future<void> getProfileImage()async
  {
    final pickedFile=await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SuccessGetProfileImageState());
    } else {
      print('No image selected.');
      emit(FailedGetProfileImageState());
    }
  }
  String? profileImageUrl;
  void uploadProfileImage()
  {
    firebase_storage.
    FirebaseStorage.
    instance.
    ref().//go to inside firebase_storage
    child('users/${Uri.file(profileImage!.path).pathSegments.last}').
    putFile(profileImage!).
    then((value) {
      value.
      ref.
      getDownloadURL().//path of image
      then((value) {
       // profileImageUrl=value;
        userModel!.profileImg=value;
        emit(SuccessUploadProfileImageState());
      }).
      catchError(onError);
    } ).
    catchError((error){
      emit(FailedUploadProfileImageState());
    });
  }
  void updateUserData({
    required String name,
    required String userName,
    required String bio,
    String? profileImage
  } )
  {
    UserModel model=UserModel(
        name: name,
        userName: userName,
        email: userModel!.email,
        phone: userModel!.phone,
        uId: userModel!.uId,
        profileImg:profileImage,
        bio:bio
    );
    FirebaseFirestore.
    instance.
    collection('users').
    doc(userModel!.uId!).
    update(model.toMap()).
    then((value){
      getUserData();
      emit(SuccessUpdateUserDataState());
    }).catchError((error){
      emit(FailedUpdateUserDataState());
    });
  }

  List<FileModel>? files;
  FileModel? selectedModel;
  String? image;
  void getAllImagesFromGallery()async
  {
    var imagePath = await StoragePath.imagesPath;
    var images = jsonDecode(imagePath) as List;
    files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    if (files != null && files!.length > 0)
      {
        selectedModel = files![0];
        image = files![0].files![0];
        emit(SuccessGetPostImageState());
      }
  }

  void uploadImagePost({
    required String text,
    required String postTime,
})
  {
    emit(LoadingGreatPostState());
    firebase_storage.
    FirebaseStorage.
    instance.
    ref().//go to inside firebase_storage
    child('posts/${Uri.file(File(image!).path).pathSegments.last}').
    putFile(File(image!)).
    then((value) {
      value.
      ref.
      getDownloadURL().//path of image
      then((value) {
        createPost(
            postTime: postTime,
            postImg: value,
            text: text);
        emit(SuccessGreatPostState());
      }).
      catchError(onError);
    } ).
    catchError((error){
      emit(FailedGreatPostState());
    });
  }
  void createPost(
      {required String postTime,
        required String text,
        required String postImg}
        )
  {
    PostModel postModel=PostModel(
      userName: userModel!.userName,
      uId: userModel!.uId,
      profileImg: userModel!.profileImg,
      postTime: postTime,
      text: text,
      postImg: postImg
    );
     FirebaseFirestore.
     instance.
     collection('posts').
     add(postModel.toMap()).//create doc
     then((value){
       emit(SuccessGreatPostState());
     }).
     catchError((error){
       emit(FailedGreatPostState());
     });
  }

  List<PostModel>posts=[];
  void getPosts()
  {
    FirebaseFirestore.
    instance.
    collection('posts').
    get().
    then((value){
      value.docs.forEach((element) {
        posts.add(PostModel.fromJson(element.data()));
      });
      emit(SuccessGetPostsState());
    }).
    catchError((error){
      emit(FailedGetPostsState(error.toString()));
    });
  }
}