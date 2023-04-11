import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:premierepark/src/features/authentication/models/parking_lot_model.dart';

class ParkingLotRepository extends GetxController{

  static ParkingLotRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ParkingLotModel>> allParkingLot() async{
    final snapshot = await _db.collection("parkingslots").orderBy("slotowner").orderBy("slotnumber").get();
    final parkinglotData = snapshot.docs.map((e) => ParkingLotModel.fromSnapshot(e)).toList();
    return parkinglotData;
  }
}