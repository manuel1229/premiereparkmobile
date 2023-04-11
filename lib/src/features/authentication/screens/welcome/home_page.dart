import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';


class HomePage extends StatelessWidget {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Logged in as:",
              style: TextStyle(fontSize: 20),
            ),
            Obx(() => Text(
                  _authController.user?.email ?? "Not logged in",
                  style: TextStyle(fontSize: 24),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _authController.signOut();
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
