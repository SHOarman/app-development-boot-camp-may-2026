import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/custumbutton.dart';
import '../authcontroller/authcontroller.dart';
import '../widget/customtextfield.dart';

class SingupPage extends StatelessWidget {
  const SingupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Authcontroller authController = Get.put(Authcontroller());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Create account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              CustomTextField(
                title: "Name",
                hintText: "Type your name...",
                controller: authController.nameController,
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 30),

              // ================= LOADING LOGIC HERE =================
              Obx(() {
                return authController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF154DA1),
                        ),
                      )
                    : CustomButton(
                        text: "Sign Up",
                        onTap: () {
                          authController.signUp();
                        },
                        backgroundColor: const Color(0xFF154DA1),
                      );
              }),

              // ======================================================
              const SizedBox(height: 40),
              const Row(
                children: [
                  Expanded(
                    child: Divider(color: Color(0xFFCECECE), thickness: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Or Sign in with",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Color(0xFFCECECE), thickness: 1),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account",
                    style: TextStyle(fontSize: 14, color: Color(0xff374151)),
                  ),
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text(
                      "? Sign in",
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
