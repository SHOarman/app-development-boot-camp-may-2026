import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/route/app_routes.dart';
import '../../widget/custumbutton.dart';
import '../authcontroller/authcontroller.dart';
import '../widget/customtextfield.dart';

class Singinpage extends StatelessWidget {
  const Singinpage({super.key});

  @override
  Widget build(BuildContext context) {
    final Authcontroller authController = Get.put(Authcontroller());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              const Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Hi welcome back",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                title: "Email",
                hintText: "Enter your mail...",
                controller: authController.emailController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                title: "Password",
                hintText: "**********",
                controller: authController.passwordController,
                isPassword: true,
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: TextButton(
              //     onPressed: () {},
              //     child: const Text(
              //       "Forgot password?",
              //       style: TextStyle(
              //         color: Color(0xFF154DA1),
              //         fontWeight: FontWeight.w600,
              //         fontSize: 14,
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 30),
              Obx(() {
                return authController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF154DA1),
                        ),
                      )
                    : CustomButton(
                        text: "Sign In",
                        backgroundColor: const Color(0xFF154DA1),
                        onTap: () {
                          authController.singIn();
                        },
                      );
              }),
              const SizedBox(height: 40),
              const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Divider(color: Color(0xFFCECECE), thickness: 1),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or Sign in with",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Divider(color: Color(0xFFCECECE), thickness: 1),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              Obx(() {
                return authController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF154DA1),
                        ),
                      )
                    : Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            authController.signInWithGoogle();
                          },
                          icon: Image.asset(
                            "assetes/icon/icons8-google-50.png",
                            height: 30,
                            width: 30,
                          ),
                          label: const Text(
                            "Continue with Google",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Color(0xFFCECECE)),
                            ),
                            minimumSize: const Size(double.infinity, 50),
                            elevation: 0,
                          ),
                        ),
                      );
              }),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.singup);
                    },
                    child: const Text(
                      "? Sign Up",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF154DA1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
