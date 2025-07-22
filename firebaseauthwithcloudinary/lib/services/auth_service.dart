import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static final _auth = FirebaseAuth.instance;
  static User? get currentUser => _auth.currentUser;

  static Future<UserCredential> singUp(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<UserCredential> singIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> singOut() async {
    return await _auth.signOut();
  }

  static Stream<User?> get authStateChanges => _auth.authStateChanges();
}
