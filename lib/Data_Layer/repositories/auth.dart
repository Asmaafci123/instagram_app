import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  AuthRepository();//(single tone) design pattern

  static final AuthRepository instance = AuthRepository();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> login(String email, String password) async {
    UserCredential result =
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {

    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    final User user = result.user!;
    return user.uid;
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}