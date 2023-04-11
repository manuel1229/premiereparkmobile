

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';

// import '../../features/authentication/controllers/comman_dailog.dart';
// import '../../features/authentication/screens/sign_screen/signin_screen.dart';
// import '../../features/authentication/screens/sign_screen/signup_screen.dart';
// import '../../features/authentication/screens/welcome/main_screen.dart';
// import 'exceptions/signup_email_password_failure.dart';


// class AuthenticationRepository extends GetxController{
//   static AuthenticationRepository get instance => Get.find();

//   final _auth = FirebaseAuth.instance;
//   late final Rx<User?> firebaseUser;
//   var userId;

//   @override
//   void onReady(){
//     firebaseUser = Rx<User?>(_auth.currentUser);
//    firebaseUser.bindStream(_auth.authStateChanges());
//     ever(firebaseUser, _setInitialScreen);
//   }

//   //   void onReady(){
//   //     firebaseUser = Rx<User?>(_auth.currentUser);
//   //   firebaseUser.bindStream;
//   // firebaseUser.value != null ? Get.offAll(() => MainScreen()) : Get.to(() =>   SignInScreen());
//   // }

//   _setInitialScreen(User? user){
//     user == null ? Get.offAll(() =>  SignUpScreen(),  transition :Transition.rightToLeft,  duration: const Duration(milliseconds: 100)) : Get.offAll(() => MainScreen()) ;
//   }

//   Future<void> createUserWithEmailAndPassword(String email, String password) async{
//     try{
//     await _auth.createUserWithEmailAndPassword(email: email, password: password);
//     firebaseUser.value != null ? Get.offAll(() => MainScreen()) : Get.to(() =>   SignInScreen());
    
//     } on FirebaseAuthException catch(e){
//       final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
//       print('FIREBASE AUTH EXCEPTION - ${ex.message}');
//       throw ex;
//     } catch (_){
//       const ex = SignUpWithEmailAndPasswordFailure();
//       print('EXCEPTION - ${ex.message}');
//       throw ex;
//     }
//   }

//  Future<void> signInWithEmailAndPassword(String suemail, String supassword) async {
//   try {
//     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//       email: suemail,
//       password: supassword,
//     );
//     // User is signed in
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found') {
//       print('No user found for that email.');
//     } else if (e.code == 'wrong-password') {
//       print('Wrong password provided for that user.');
//     }
//   }
//   }
//   Future<void> logout() async => await _auth.signOut();

// Future<void> login(email, password) async{

//     print('$email,$password');
//     try {
//       CommanDialog.showLoading();
//       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email.trim(),
//         password: password
//       );
//       if (userCredential.user!.emailVerified) {
//         print(userCredential.user!.uid);
//         userId = userCredential.user!.uid;
//         CommanDialog.hideLoading();
//       } else {
//           await userCredential.user!.sendEmailVerification();
//         await FirebaseAuth.instance.signOut();
      
//         CommanDialog.showErrorDialog(
//           title: "Login failed",
//           description: "Email not verified. Please check your inbox for a verification email."
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       CommanDialog.hideLoading();
//       if (e.code == 'user-not-found') {
//         CommanDialog.showErrorDialog(
//           title: "Login failed",
//           description: "Invalid Email"
//         );
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         CommanDialog.showErrorDialog(
//           title: "Login failed",
//           description: "Wrong password"
//         );
//         print('Wrong password provided for that user.');
//       } else {
//          CommanDialog.showErrorDialog(
//           title: "Login failed",
//           description: "Wrong email or password"
//         );
//         print('Wrong email or password.');
//       }
//     }
// }

//   Future<void> signUp(username, fullname, phoneNo, email, password) async {
//   try {
//     CommanDialog.showLoading();

//     UserCredential userCredential =
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email.trim(),
//       password: password,
//     );

//     // Send email verification
//     await userCredential.user!.sendEmailVerification();

//     // Save user data to Firestore
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(userCredential.user!.uid)
//         .set({
//       "username": username,
//       "fullname": fullname,
//       "phoneNo": phoneNo,
//       "email": userCredential.user!.email,
//     });

//     await _auth.signOut();

//     CommanDialog.hideLoading();
//   } on FirebaseAuthException catch (e) {
//     CommanDialog.hideLoading();
//     if (e.code == 'weak-password') {
//       CommanDialog.showErrorDialog(
//           description: "The password provided is too weak.");
//       print('The password is too weak');
//     } else if (e.code == 'email-already-in-use') {
//       CommanDialog.showErrorDialog(description: "Email is already in use.");
//       print('Email is already in use.');
//     }
//   } catch (e) {
//     print(e);
//   }
// }



// }