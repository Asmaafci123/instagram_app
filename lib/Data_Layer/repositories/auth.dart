import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intnstagram/Data_Layer/models/user_model.dart';

class AuthRepository {
  AuthRepository._();//(single tone) design pattern

  static final AuthRepository instance = AuthRepository._();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> login(String email, String password) async {
    UserCredential result =
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password:password);
    print(email);
    print(password);
    final User user = result.user!;
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {

    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;
    return user.uid;
  }
  Future<void> createUser(
      String email,
      String name,
      String userName,
      String password,
      String uId,
      String phone,
      ) async {
    UserModel userModel=UserModel(
      name: name,
      userName: userName,
      email: email,
      uId: uId,
      phone: phone,
      profileImg:'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
      bio: 'Write your bio...'
    );
    await FirebaseFirestore.instance.collection('users').doc(uId).set(userModel.toMap());
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}