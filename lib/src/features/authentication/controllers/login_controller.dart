import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../repository/firebase_authservice.dart';
//import 'firebase_auth_service.dart';

class LoginController extends GetxController {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final RxBool isLoading = false.obs;

  // Email and password text fields
  final RxString email = ''.obs;
  final RxString password = ''.obs;

  // Login function
  Future<void> login() async {
    isLoading.value = true;
    try {
      final String? message = await _authService.signInWithEmailAndPassword(email.value, password.value);
      Get.snackbar('Success', message!);
    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found'){
        Get.snackbar('Login failed', "User not found");
      }
      Get.snackbar('Error', e.message!);
    } finally {
      isLoading.value = false;
    }
  }

  // Sign up function
  Future<void> signUp() async {
    isLoading.value = true;
    try {
      final String? message = await _authService.signUpWithEmailAndPassword(email.value, password.value);
      Get.snackbar('Success', message!);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message!);
    } finally {
      isLoading.value = false;
    }
  }
}
