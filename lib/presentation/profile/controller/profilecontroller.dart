import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/route/app_routes.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var userEmail = ''.obs;
  var userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        userEmail.value = user.email ?? "No Email Found";
        userName.value = user.displayName ?? "No Name Found";
      } else {
        userEmail.value = '';
        userName.value = '';
      }
    });
  }

  void getUserData() {
    User? user = _auth.currentUser;
    if (user != null) {
      userEmail.value = user.email ?? "No Email Found";
      userName.value = user.displayName ?? "No Name Found";
    }
  }

  //==============================logout=======================================

  Future<void> logout() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      Get.offAllNamed(AppRoutes.Singin);
    } catch (e) {
      Get.snackbar("Error", "Logout failed: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}