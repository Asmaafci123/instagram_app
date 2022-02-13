class UserModel
{
  String? name;
  String? userName;
  String? email;
  String? phone;
  String? uId;
  String? profileImg;
  String? bio;
  UserModel({this.email,this.name,this.phone,this.uId,this.profileImg,this.bio,this.userName});
  UserModel.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    userName=json['userName'];
    email=json['email'];
    phone=json['phone'];
    uId=json['uId'];
    profileImg=json['image'];
    bio=json['bio'];
  }
  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'userName':userName,
      'email':email,
      'phone':phone,
      'uId':uId,
      'image':profileImg,
      'bio':bio
    };
  }
}