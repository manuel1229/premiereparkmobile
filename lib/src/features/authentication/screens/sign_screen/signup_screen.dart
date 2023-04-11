
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:evacuatefv2/services/firebase_auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:evacuatefv2/model/user_model.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/colorutil.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/signup_controller.dart';


// import 'home_screen.dart';


class  SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);



  
   Map<String, String> userSignUpData = {
    "username": "",
    "fullname": "",
    "phoneNumber": "",
    "email": "",
    "password": ""}; 


  final AuthController _authController = Get.find();
  final controller = Get.put(SignUpController());
  // final TextEditingController _userNameTextController = TextEditingController();
  // final TextEditingController _fNameTextController = TextEditingController();
  // final TextEditingController _lNameTextController = TextEditingController();
  // final TextEditingController _numberTextController = TextEditingController();
  // final TextEditingController _emailTextController = TextEditingController();
  // final TextEditingController _passwordTextController = TextEditingController();
  // final TextEditingController _cpasswordTextController = TextEditingController();
  
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
        color: tSecondaryColor, 
       ),
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: tSecondaryColor),
        ),
      ),
       body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [ 
     hexStringToColor("FFBC00"),
      hexStringToColor("000000")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
           child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Form(
                key: _formKey,
                child : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.username,
                    style: TextStyle(color: tTextColor),
                    decoration: InputDecoration(
                      label: Text (sUsername),
                      fillColor: Colors.white.withOpacity(0.9), filled: true,
                      labelStyle: TextStyle(color: Color.fromARGB(255, 41, 41, 41).withOpacity(0.9)),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 0,style: BorderStyle.none) 
                     ),
                     focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), 
                      borderSide: BorderSide(width: 2.0, color: tFocusText)
                     )
                      ),
                         validator:(value){
		                  if(value == null || value.isEmpty){
		                  return 'Username Required';
		                    } 
		                    return null;
	                    },
                      onSaved: (value){
	                    userSignUpData['username'] = value!;
	                    },
                  ),
                  
                  const SizedBox(height: tFormHeight-15),
                  TextFormField(
                    controller: controller.fullname,
                    style: TextStyle(color: tTextColor),
                    decoration: InputDecoration(
                      label: Text (sFullname),
                      fillColor: Colors.white.withOpacity(0.9), filled: true,
                      labelStyle: TextStyle(color: Color.fromARGB(255, 41, 41, 41).withOpacity(0.9)),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 0,style: BorderStyle.none) 
                     ),
                     focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), 
                      borderSide: BorderSide(width: 2.0, color: tFocusText)
                     )
                      ),
                        validator:(value){
		                  if(value == null || value.isEmpty){
		                  return 'Fullname Required';
		                    } 
		                    return null;
	                    },
                      onSaved: (value){
	                    userSignUpData['fullname'] = value!;
	                    },
                  ),
                  const SizedBox(height: tFormHeight-15),
                  TextFormField(
                    controller: controller.phoneNo,
                    style: TextStyle(color: tTextColor),
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    decoration: InputDecoration(
                      counterText: '',
                      label: Text (sNumber),
                     fillColor: Colors.white.withOpacity(0.9), filled: true,
                      labelStyle: TextStyle(color: Color.fromARGB(255, 41, 41, 41).withOpacity(0.9)),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 0,style: BorderStyle.none) 
                     ),
                     focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), 
                      borderSide: BorderSide(width: 2.0, color: tFocusText)
                     )
                      ),
                        validator:(value){
		                  if(value == null || value.isEmpty){
		                  return 'Phone number Required';
		                    } 
		                    return null;
	                    },
                      onSaved: (value){
	                    userSignUpData['phoneNumber'] = value!;
	                    },
                  ),
                  const SizedBox(height: tFormHeight-15),
                  TextFormField(
                    controller: controller.email,
                    style: TextStyle(color: tTextColor),
                    decoration: InputDecoration(
                      label: Text (sEmail),
                     fillColor: Colors.white.withOpacity(0.9), filled: true,
                      labelStyle: TextStyle(color: Color.fromARGB(255, 41, 41, 41).withOpacity(0.9)),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 0,style: BorderStyle.none) 
                     ),
                     focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), 
                      borderSide: BorderSide(width: 2.0, color: tFocusText)
                     )
                      ),
                        validator:(value){
		                  if(value == null || value.isEmpty){
		                  return 'Email Required';
		                    } 
		                    return null;
	                    },
                      onSaved: (value){
	                    userSignUpData['email'] = value!;
	                    },
                  ),
                  const SizedBox(height: tFormHeight-15),
                  TextFormField(
                     obscureText: true,
                    controller: controller.password,
                    style: TextStyle(color: tTextColor),
                    decoration: InputDecoration(
                      label: Text (sPassword),
                      fillColor: Colors.white.withOpacity(0.9), filled: true,
                      labelStyle: TextStyle(color: Color.fromARGB(255, 41, 41, 41).withOpacity(0.9)),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 0,style: BorderStyle.none) 
                     ),
                     focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), 
                      borderSide: BorderSide(width: 2.0, color: tFocusText)
                     )
                      ),
                        validator:(value){
		                  if(value == null || value.isEmpty){
		                  return 'Password Required';
		                    }
                        else if(value.length <= 8){
                            return 'Password should be atleast 8 characters';
                        }
                        return null;
                        }, 
                      onSaved: (value){
                        userSignUpData['password'] = value!;
                      },
                  ),
                  const SizedBox(height: tFormHeight-15),
                  TextFormField(
                     obscureText: true,
                    style: TextStyle(color: tTextColor),
                    decoration: InputDecoration(
                      label: Text (sCPassword),
                      fillColor: Colors.white.withOpacity(0.9), filled: true,
                      labelStyle: TextStyle(color: Color.fromARGB(255, 41, 41, 41).withOpacity(0.9)),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 0,style: BorderStyle.none) 
                     ),
                     focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0), 
                      borderSide: BorderSide(width: 2.0, color: tFocusText)
                     )
                      ),
                        validator:(value){
		                  if(value == null || value.isEmpty){
		                  return 'Confrim Password Required';
		                    } 
                        else if(value != controller.password.text.trim()){
                          return 'Password does not match';
                        }
		                    return null;
	                    },
                      // onSaved: (value){
	                    // userSignUpData['cpassword'] = value!;
	                    // },
                  ),
                    const SizedBox(height: tFormHeight-15),
                    Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                      onPressed: (){},
                      // {
                      //   if(_formKey.currentState!.validate()){
                         
                      //    final user = UserModel(
                      //     username: controller.username.text.trim(),
                      //     fullname: controller.fullname.text.trim(), 
                      //     phoneNo:  controller.phoneNo.text.trim(), 
                      //     email:    controller.email.text.trim(), 
                      //     password: controller.password.text.trim(),
                      //     );
                      //      SignUpController.instance.createUser(user);
                      //     //Get.to(() => const SignInScreen());
                      //     SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                      //   }
                      // },
                       style: ButtonStyle(
                        
            backgroundColor: MaterialStateProperty.resolveWith((states){
              if (states.contains(MaterialState.pressed)){
                return Colors.black26;
              }
              return Color.fromARGB(255, 29, 28, 28);
            }),
             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                      child: Text(sRegister.toUpperCase(),
                      style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize:16)),
                    ),
                  )        
                ],               
        ),
      ),
      ),
      ),
    ),
    );
  }

  // void signUp() async{
  //     if(_formKey.currentState!.validate()){
  //       print("Form is valid");
  //       _formKey.currentState!.save();
  //       print('User Sign Up Data $userSignUpData');
  //       controllerr.signUp(userSignUpData['username'], userSignUpData['fullname'], userSignUpData['phoneNumber'],userSignUpData['email'], userSignUpData['password']);
  //     }
  // } 

 

  // postDetailsToFirestore() async{
  //   //calling firestore
  //   //calling user model
  //   //sending values
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // User? user = _auth.currentUser;

  // UserModel userModel = UserModel();

  // //writing all the values
 
  // userModel.email = user!.email;
  // userModel.uid = user.uid;
  // userModel.username = _userNameTextController.text;

  // await firebaseFirestore
  // .collection("users")
  // .doc(user.uid)
  // .set(userModel.toMap());
  // Fluttertoast.showToast(msg: "Account created successfully :)");

  // Navigator.pushAndRemoveUntil(
  //   (context),
  //  MaterialPageRoute(builder: (context)=> HomeScreen()),
  //   (route) => false);

  // }

}