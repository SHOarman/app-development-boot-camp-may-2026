import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexpense/presentation/widget/custumbutton.dart';
import 'package:mexpense/presentation/widget/navigatbutton.dart';
import 'controller/profilecontroller.dart';

class Profile extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Nev_Button(selectIndex: 2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),

              const Center(
                child: Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Center(
                child: Column(
                  children: [
                    const Icon(Icons.account_circle, size: 100, color: Colors.grey),
                    const SizedBox(height: 15),

                    Obx(() => Text(
                      controller.userName.value,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
                    const SizedBox(height: 5),
                    Obx(() => Text(
                      controller.userEmail.value,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                      ),
                    )),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              CustomButton(
                text: "Logout",
                backgroundColor: Colors.redAccent,
                onTap: () {
                  Get.dialog(
                    Dialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.logout, size: 50, color: Colors.redAccent),
                            const SizedBox(height: 15),
                            const Text(
                              "Logout?",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Are you sure you want to log out from the app?",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[200],
                                      foregroundColor: Colors.black,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                    ),
                                    onPressed: () => Get.back(),
                                    child: const Text("Cancel"),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent,
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                      controller.logout();
                                    },
                                    child: const Text("Logout", style: TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}