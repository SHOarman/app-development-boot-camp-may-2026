import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexpense/core/route/app_routes.dart';
import 'package:mexpense/presentation/widget/custumbutton.dart';
import '../controller/moneysecation_controller.dart';

class Addexpensivepage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final MoneysecationController controller = Get.find();

  Addexpensivepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Expense")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Item Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Price",
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            CustomButton(
              text: "Save Expense",
              onTap: () {
                String input = amountController.text;
                double? amount = double.tryParse(input);

                if (amount != null) {
                  controller.addExpense(
                    nameController.text.isEmpty
                        ? "Other Expense"
                        : nameController.text,
                    amount,
                  );

                  Get.rawSnackbar(
                    title: "Success",
                    message: "Expense saved successfully!",
                    backgroundColor: Colors.green,
                    snackPosition: SnackPosition.TOP,
                    margin: const EdgeInsets.all(10),
                    borderRadius: 10,
                  );

                  Future.delayed(const Duration(milliseconds: 500), () {
                    Get.toNamed(AppRoutes.money);
                  });
                } else {
                  Get.snackbar(
                    "Error",
                    "Enter valid amount",
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