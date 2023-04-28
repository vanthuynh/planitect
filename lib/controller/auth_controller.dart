import 'dart:io';
import 'dart:developer' as developer;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../views/bottom_nav_bar/bottom_bar_view.dart';
import '../views/profile/add_profile.dart';
import 'package:path/path.dart' as Path;
import 'package:van_main_flutter_app/views/home/home_screen.dart';

class AuthController extends GetxController {
  // create firebase instance
  FirebaseAuth auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  void login({String? email, String? password}) {
    isLoading(true); // assign true to show circular process indicator

    auth.signInWithEmailAndPassword(email: email!, password: password!).then((value) {
      /// Login Success
      isLoading(false); // assign false when done logging in
      Get.to(() => BottomBarView());
    }).catchError((e) {
      isLoading(false);
      Get.snackbar('Error', "$e");
    });
  }

  void signUp({String? email, String? password}) {
    ///here we have to provide two things
    ///1- email
    ///2- password

    isLoading(true);

    auth.createUserWithEmailAndPassword(email: email!, password: password!).then((value) {
      isLoading(false);

      /// Navigate user to profile screen
      Get.to(() => ProfileScreen());
    }).catchError((e) {
      developer.log("Error in authentication $e");
      isLoading(false);
    });
  }

  void forgetPassword(String email) {
    auth.sendPasswordResetEmail(email: email).then((value) {
      Get.back();
      Get.snackbar('Email Sent', 'We have sent password reset email');
    }).catchError((e) {
      developer.log("Error in sending password reset email is $e");
    });
  }

  signInWithGoogle() async {
    isLoading(true);
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      isLoading(false);

      ///SuccessFull loged in
      Get.to(() => BottomBarView());
    }).catchError((e) {
      /// Error in getting Login
      isLoading(false);
      developer.log("Error is $e");
    });
  }


  var isProfileInformationLoading = false.obs; // make it observable

  // function to upload profile image to firestore
  Future<String> uploadImageToFirebaseStorage(File image) async {
    String imageUrl = '';
    String fileName = Path.basename(image.path);

    var reference = FirebaseStorage.instance.ref().child('profileImages/$fileName');
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    await taskSnapshot.ref.getDownloadURL().then((value) {
      imageUrl = value;
    }).catchError((e) {
      developer.log("Error happen $e");
    });

    return imageUrl;
  }



  // Function to upload profile data to firestore
  uploadProfileData(String imageUrl, String firstName, String lastName,
      String mobileNumber, String dob, String gender) {

    String uid = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance.collection('users').doc(uid).set({
      'image': imageUrl,
      'first': firstName,
      'last': lastName,
      'dob': dob,
      'gender': gender
    }).then((value) {
      isProfileInformationLoading(false);
      Get.offAll(()=> BottomBarView());
    });

  }
}