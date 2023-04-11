import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/comman_dailog.dart';


class SignInScreen extends StatelessWidget {
  final AuthController _authController = Get.find();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(hintText: "Email"),),
                  TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(hintText: "Password"),
          ),
          ElevatedButton(
            onPressed: () async {
              
              await _authController.signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text);
                 
            },
            child: Text("Sign In"),
          ),
        ],
      ),
    );
  }
}