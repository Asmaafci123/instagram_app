abstract class AppStates{}
class InitialAppState extends AppStates{}

class LoadingGetUserState extends AppStates{}
class SuccessGetUserState extends AppStates{}
class FailedGetUserState extends AppStates{
  String error;
  FailedGetUserState(this.error);
}
class ChangeBottomNavState extends AppStates{}
class NewPostState extends AppStates{}


class SuccessGetProfileImageState extends AppStates{}
class FailedGetProfileImageState extends AppStates{}

class SuccessUploadProfileImageState extends AppStates{}
class FailedUploadProfileImageState extends AppStates{}

class SuccessUpdateUserDataState extends AppStates{}
class FailedUpdateUserDataState extends AppStates{}

//post
class SuccessGetPostImageState extends AppStates{}
class FailedGetPostImageState extends AppStates{}

class LoadingGreatPostState extends AppStates{}
class SuccessGreatPostState extends AppStates{}
class FailedGreatPostState extends AppStates{}

class LoadingGetPostsState extends AppStates{}
class SuccessGetPostsState extends AppStates{}
class FailedGetPostsState extends AppStates {
  String error;

  FailedGetPostsState(this.error);
}