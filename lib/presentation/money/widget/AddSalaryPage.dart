import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexpense/core/route/app_routes.dart';
import 'package:mexpense/presentation/widget/custumbutton.dart';
import '../controller/moneysecation_controller.dart';

class AddSalaryPage extends StatelessWidget {
  final TextEditingController sourceController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final MoneysecationController controller = Get.find();

  AddSalaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Salary")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: sourceController,
              decoration: const InputDecoration(
                labelText: "Salary Source (e.g. Office)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            CustomButton(
              text: "Save Salary",
              onTap: () {
                String input = amountController.text;
                double? amount = double.tryParse(input);

                if (amount != null) {
                  controller.addSalary(
                    sourceController.text.isEmpty
                        ? "Monthly Salary"
                        : sourceController.text,
                    amount,
                  );

                  Get.rawSnackbar(
                    title: "Success",
                    message: "Salary added successfully!",
                    backgroundColor: Colors.green,
                    snackPosition: SnackPosition.TOP,
                  );

                  Future.delayed(const Duration(milliseconds: 500), () {
                    Get.toNamed(AppRoutes.deshbord);
                  });
                } else {
                  Get.snackbar(
                    "Error",
                    "Please enter valid amount",
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                  );
                }
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}