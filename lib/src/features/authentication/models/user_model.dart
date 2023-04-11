

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String? id;
  final String username;
  final String fullname;
  final String email;
  final String phoneNo;
  //final String password;

  const UserModel({
    this.id,
    required this.username,
    required this.fullname,
    required this.phoneNo,
    required this.email,
    //required this.password,
    
  });

  toJson(){
    return{
    "Fullname": fullname,
    "Username": username,
    "Email": email,
    "phoneNo": phoneNo,
   // "Password": password,
  };
  }
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
      id:  document.id,
      username: data["username"], 
      fullname: data["fullname"], 
      phoneNo: data["phoneNo"], 
      email: data["email"]);
      //password: data["password"]);
  }
}