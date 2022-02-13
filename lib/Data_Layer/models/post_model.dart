class PostModel
{
  String? userName;
  String? uId;
  String? profileImg;
  String? text;
  String? postTime;
  String? postImg;
  PostModel({this.uId,this.profileImg,this.userName,this.text,this.postTime,this.postImg});
  PostModel.fromJson(Map<String,dynamic>json)
  {
    userName=json['userName'];
    uId=json['uId'];
    profileImg=json['image'];
    text=json['text'];
    postTime=json['postTime'];
    postImg=json['postImg'];
  }
  Map<String,dynamic> toMap()
  {
    return {
      'userName':userName,
      'uId':uId,
      'image':profileImg,
      'text':text,
      'postTime':postTime,
      'postImg':postImg,
    };
  }
}