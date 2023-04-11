import 'package:get/get.dart';
import 'package:premierepark/src/features/authentication/controllers/auth_controller.dart';
import 'package:premierepark/src/features/authentication/models/parking_lot_model.dart';
import 'package:premierepark/src/repository/parking_lot_repository/parking_lot_repository.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthController());
  final _userRepo = Get.put(UserRepository());
  final _parkinglotRepo  = Get.put(ParkingLotRepository());

  getUserData(){
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUser();
  }

  Future<List<ParkingLotModel>> getAllParkingLot() async{
    return await _parkinglotRepo.allParkingLot();
  }
}