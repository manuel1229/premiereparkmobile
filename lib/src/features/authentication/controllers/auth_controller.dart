import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:premierepark/src/features/authentication/controllers/comman_dailog.dart';

class AuthController extends GetxController {
FirebaseAuth _auth = FirebaseAuth.instance;

  Rxn<User> _firebaseUser = Rxn<User>();

  User? get user => _firebaseUser.value;

  String get userId => _firebaseUser.value!.uid;

  bool get isEmailVerified => _firebaseUser.value!.emailVerified;

  get firebaseUser => null;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.sendEmailVerification();
    } catch (e) {
      Get.snackbar("Error creating account", e.toString());
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
       CommanDialog.showLoading();
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
           CommanDialog.hideLoading();
      if (userCredential.user!.emailVerified) {
       Get.snackbar(
  'Login Success',
  '',
  titleText: const Text(
    'Login Success',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  ),
  messageText: const Text(
    'Welcome back!',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 16.0,
    ),
  ),
);
      //  await signOutEnotV(); 
        }
        else if (!userCredential.user!.emailVerified){
          await signOutEnotV();
        }
       
    } on FirebaseAuthException catch (e) {
       CommanDialog.hideLoading();
        if(e.code == 'user-not-found'){
        Get.snackbar('Login failed', "User not found.");
      }
      else if(e.code == 'wrong-password'){
        Get.snackbar('Login failed', "Password is incorrect.");
      }
      else {
        Get.snackbar("Error signing in", e.toString());
      }

       
     
    }
  }

  Future<void> signOut() async {
   
    await _auth.signOut();
     CommanDialog.hideLoading();
  }

  Future<void> signOutEnotV() async{
     Get.snackbar("Email not verified", "Please verify your email");
    await _auth.signOut();
  }

  Future<void> signOutLO() async{
        Get.snackbar(
  '',
  '',
  titleText: const Text(
    'Logged out Successfully!!!',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  ),
);
    await _auth.signOut();
    
  }

  Future<void> checkEmailVerification() async {
    await _firebaseUser.value!.reload();
    if (!_firebaseUser.value!.emailVerified) {
      Get.snackbar("Email not verified", "Please verify your email");
     
      await signOut();
    }
  }
}
