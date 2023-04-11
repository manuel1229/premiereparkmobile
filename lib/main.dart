import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:premierepark/firebase_options.dart';
import 'package:premierepark/src/features/authentication/screens/sign_screen/signin_screen.dart';
import 'package:premierepark/src/features/authentication/screens/sign_screen/signup_screen.dart';
import 'package:premierepark/src/features/authentication/screens/welcome/home_page.dart';
import 'package:premierepark/src/features/authentication/screens/welcome/main_screen.dart';

import 'src/features/authentication/controllers/auth_controller.dart';


Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   
    
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
       Get.put(AuthController());

       AuthController authController = Get.find();
       User? user = authController.user;
       if(user != null && user.emailVerified){
        await authController.signInWithEmailAndPassword(email: user.email!, password: "password");
       }
        runApp(GetMaterialApp(home: MyApp()));

 

}

class MyApp extends StatelessWidget {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
     
    return Obx(() => MaterialApp(
           debugShowCheckedModeBanner: false,
              
          title: 'Flutter Firebase Auth with GetX',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            
          ),
          home: _authController.user == null ?  SignInScreen() : MainScreen(),
          routes: {
            '/signup': (context) => SignUpScreen(),
            '/signin': (context) => SignInScreen(),
            '/home': (context) => MainScreen(),
          },
        ));
  }
}