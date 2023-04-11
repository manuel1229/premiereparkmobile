

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:premierepark/src/features/authentication/controllers/auth_controller.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fName = TextEditingController();
  final lName = TextEditingController();
  final phoneNo = TextEditingController();
  final username = TextEditingController();
  final fullname = TextEditingController();

  final userRepo = Get.put(UserRepository());

  // void registerUser(String email, String password){
  //     String? error = AuthController().instance.createUserWithEmailAndPassword(email, password) as String?;
  //     if (error != null){
  //       Get.showSnackbar(GetSnackBar(message: error.toString()));
  //     }
  //     // AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  // }

  Future<void> createUser(UserModel user) async{
    await userRepo.createUser(user);
  }

  
}