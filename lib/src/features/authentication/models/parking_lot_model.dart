import 'package:cloud_firestore/cloud_firestore.dart';

class ParkingLotModel{
 
 final String? id;
 final num slotnumber;
 final String slotfloor;
 final String slotowner;
 final String status;

 const ParkingLotModel({
  this.id,
  required this.slotnumber,
  required this.slotfloor,
  required this.slotowner,
  required this.status,
 
 });

toJson(){
  return{
    "slotnumber": slotnumber,
    "slotfloor": slotfloor,
    "slotowner": slotowner,
    "status": status,
  };
}
factory ParkingLotModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
  final data = document.data()!;
  return ParkingLotModel(
    slotnumber: data["slotnumber"], 
    slotfloor: data["slotfloor"], 
    slotowner: data["slotowner"], 
    status: data["status"]);
 }
}