import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Sign in with email and password
  Future<String?> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Sign in successful';
    } on FirebaseAuthException catch (e) {
        if(e.code == 'user-not-found'){
        Get.snackbar('Login failed', "User not found");
      }

      return e.message;
    }
  }
  
  // Sign up with email and password
  Future<String?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser?.sendEmailVerification(); // Send email verification
      return 'Sign up successful. Verification email sent to $email';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  
  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }
  
  // Check if user is signed in
  bool isSignedIn() {
    return _auth.currentUser != null;
  }
  
  // Get current user ID
  String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }
}
