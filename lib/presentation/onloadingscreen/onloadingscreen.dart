import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/route/app_routes.dart';

class Onloadingscreen extends StatefulWidget {
  const Onloadingscreen({super.key});

  @override
  State<Onloadingscreen> createState() => _OnloadingscreenState();
}

class _OnloadingscreenState extends State<Onloadingscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Get.offAllNamed(AppRoutes.deshbord);
      } else {
        Get.offAllNamed(AppRoutes.Singin);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assetes/icon/iconnew.png",),
            ],
          ),
        ),
      ),
    );
  }
}