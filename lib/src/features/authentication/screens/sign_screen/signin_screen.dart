
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:premierepark/src/features/authentication/screens/sign_screen/sample_page.dart';
import 'package:premierepark/src/features/authentication/screens/sign_screen/signup_screen.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/colorutil.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/signin_controller.dart';


class SignInScreen extends StatelessWidget {
   SignInScreen({Key? key}) : super(key: key);

 
final _formKey = GlobalKey<FormState>();
  Map<String, String> userLoginData = {"email": "", "password": ""}; 

 final AuthController _authController = Get.find();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   
   

 
    
 
    
    return Scaffold(
      
      //backgroundColor: tPrimaryColor,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(tDefaultSize),
           decoration: BoxDecoration(
          gradient: LinearGradient(colors: [ 
      hexStringToColor("FFBC00"),
      hexStringToColor("000000")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            
            children: [
              SizedBox(height: 150),
              const Image(image: AssetImage(tLoginImage)),
              SizedBox(height: 50),

            Form(
              key: _formKey,
              child: Column(
                children: [
                   const SizedBox(height: tFormHeight-15),
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    style: TextStyle(color: tTextColor),
                    decoration: InputDecoration(

                    prefixIcon:  Container(
                    padding: EdgeInsets.all(10.0),
                   margin: EdgeInsets.only(right: 8.0),
                  
                  child: Icon(
                  Icons.email_outlined,
                  color: Colors.black87,
                  ),
                  ),
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
	                    userLoginData['email'] = value!;
	                    },
                  ),
                  const SizedBox(height: tFormHeight-15),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    style: TextStyle(color: tTextColor),
                    decoration: InputDecoration(
                      prefixIcon:  Container(
                    padding: EdgeInsets.all(10.0),
                   margin: EdgeInsets.only(right: 8.0),
                  
                  child: Icon(
                  Icons.lock_outlined,
                  color: Colors.black87,
                  ),
                  ),
                      label: Text (sPassword),
                      fillColor: Colors.white.withOpacity(0.9), filled: true,
                      labelStyle: TextStyle(color: Color.fromARGB(255, 41, 41, 41).withOpacity(0.9)),
                       suffixIcon:IconButton(
                          onPressed: null,
                          icon: Icon(Icons.remove_red_eye_sharp),
                      ), 
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
		                    return null;
	                    },
                      onSaved: (value){
	                    userLoginData['password'] = value!;
	                    },
                  ),
                 SizedBox(
                  height: 30,
                  child: Align(
                    
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      
                        onPressed: (){}, child: const Text(sForgetPassword),
                    ),
                  ),
                 ),
                 SizedBox(height: 15),
                    Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                      onPressed: () async {
              
                  await _authController.signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text);
                 
            },
                       style: ButtonStyle(
                        
            backgroundColor: MaterialStateProperty.resolveWith((states){
              if (states.contains(MaterialState.pressed)){
                return Colors.black26;
              }
              return Colors.white;
            }),
             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                      child: Text(sSignin.toUpperCase(),
                      style: const TextStyle(
                color: Colors.black87, fontWeight: FontWeight.bold, fontSize:16)),
                    ),
                  ),
                  SizedBox(height: 10),
                   Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: ElevatedButton(
                      //  onPressed: (){  Get.to(() => SignUpScreen(), transition :Transition.rightToLeftWithFade,  duration: const Duration(milliseconds: 500));}, 
                       onPressed: (){  Get.to(() => SamplePageScreen(), transition :Transition.rightToLeftWithFade,  duration: const Duration(milliseconds: 500));}, 
                       //{
                      //   // if(_formKey.currentState!.validate()){
                      //   //   SignInController.instance.loginUser(controller.suemail.text.trim(), controller.supassword.text.trim());
                      //   // }

                        
                      // },
                       style: ButtonStyle(
                        
            backgroundColor: MaterialStateProperty.resolveWith((states){
              if (states.contains(MaterialState.pressed)){
                return Color.fromARGB(66, 126, 122, 122);
              }
              return Color.fromARGB(255, 29, 28, 28);
            }),
             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                      child: Text(sSignup.toUpperCase(),
                      style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize:16)),
                    ),
                  )          
                ],
              ),
            ),
             const SizedBox(height: tFormHeight -20),

            ],
          ),
        ),
      ),
    
      );
  }



  
  }
