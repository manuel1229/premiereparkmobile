import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:premierepark/src/features/authentication/controllers/comman_dailog.dart';
import 'package:premierepark/src/features/authentication/models/parking_lot_model.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/profile_controller.dart';
import '../../models/user_model.dart';

class MainScreen extends StatelessWidget{
   MainScreen({Key? key}) : super(key:key);
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context){
final controller = Get.put(ProfileController());
    return Scaffold(
         appBar: AppBar(
       actions: [
        IconButton(onPressed: () { 
          showDialog(
                  context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                      title: Text("Logout"),
                      content: Text("Are you sure you want to logout?"),
                      actions: [
                      TextButton(
                      child: Text("No"),
                      onPressed: () {
                    Navigator.of(context).pop();
                    },
                    ),
        TextButton(
          child: Text("Yes"),
          onPressed: () {
            // perform delete action here
            Navigator.of(context).pop();
          
            AuthController().signOutLO();
              // Get.to(() => const SignInScreen(), transition :Transition.leftToRight,  duration: const Duration(milliseconds: 500));

            
          },
        ),
      ],
    );
  });
  }, icon: const Icon(LineAwesomeIcons.alternate_sign_out)),
       ],
        title: const Text(sParkingSlots, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
      elevation: 0,
      backgroundColor: tMenuBarColor,
      ),
   body: Container(
  padding: const EdgeInsets.all(tDefaultSize),
  child: FutureBuilder<List<ParkingLotModel>>(
    future: controller.getAllParkingLot(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasData) {
          return ListView.builder(
  shrinkWrap: true,
  itemCount: snapshot.data!.length,
  itemBuilder: (c, index) {
    String document = snapshot.data![index].status;
    if (document == 'vacant') {
      return SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              iconColor: Colors.blue,
              tileColor: Colors.blue.withOpacity(0.1),
              leading: const Image(image: AssetImage(tAvailable)),
              title: Text("Establishment: ${snapshot.data![index].slotowner}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Slot# : ${snapshot.data![index].slotnumber.toString()}    Floor: ${snapshot.data![index].slotfloor}"),
                  //   Text("Floor: ${snapshot.data![index].slotfloor}"),
                ],
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              iconColor: Colors.blue,
              tileColor: Colors.blue.withOpacity(0.1),
              leading: const Image(image: AssetImage(tOccuppied)),
              title: Text("Establishment: ${snapshot.data![index].slotowner}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Slot# : ${snapshot.data![index].slotnumber.toString()}    Floor: ${snapshot.data![index].slotfloor}"),
                  //   Text("Floor: ${snapshot.data![index].slotfloor}"),
                ],
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      );
    }
  },
);

        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return const Center(child: Text('Something went wrong.'));
        }
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  ),
),
    );   
  }

}