

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../../../constants/colors.dart';
// import '../../../../constants/sizes.dart';
// import '../../../../constants/text_string.dart';
// import '../../controllers/signin_controller.dart';

// class signin_form_widget extends StatelessWidget {
//   const signin_form_widget({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   final SignInController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: Form
//       child: Column(
//         children: [
//            const SizedBox(height: tFormHeight-15),
//             TextFormField(
//             controller: controller.suemail,
//             style: TextStyle(color: tTextColor),
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.email_outlined) ,
//               label: Text (sEmail),
//               fillColor: Colors.white.withOpacity(0.3), filled: true,
//               labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
//               border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20.0),
//               borderSide: const BorderSide(width: 0,style: BorderStyle.none) 
//              ),
//              focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20.0), 
//               borderSide: BorderSide(width: 2.0, color: tFocusText)
//              )
//               ),
//           ),
//           const SizedBox(height: tFormHeight-15),
//           TextFormField(
//             controller: controller.supassword,
//             style: TextStyle(color: tTextColor),
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.lock_outline),
//               label: Text (sPassword),
//               fillColor: Colors.white.withOpacity(0.3), filled: true,
//               labelStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
//                suffixIcon:IconButton(
//                   onPressed: null,
//                   icon: Icon(Icons.remove_red_eye_sharp),
//               ), 
//               border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20.0),
//               borderSide: const BorderSide(width: 0,style: BorderStyle.none)
//               ),
//              focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(20.0), 
//               borderSide: BorderSide(width: 2.0, color: tFocusText)
//              )
//               ),
//           ),
//           const SizedBox(height: tFormHeight -20),
//           Align(
//             alignment: Alignment.centerRight,
//             child: TextButton(
//                 onPressed: (){}, child: const Text(sForgetPassword),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }