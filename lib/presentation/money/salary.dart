import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexpense/presentation/money/widget/AddSalaryPage.dart';
import 'package:mexpense/presentation/money/widget/moneysectioncard.dart';
import 'package:mexpense/presentation/widget/custumbutton.dart';
import 'controller/moneysecation_controller.dart';

class Salary extends StatelessWidget {
  final MoneysecationController controller = Get.find();

  Salary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      body: Obx(() {
        return Stack(
          children: [
            controller.salaryList.isEmpty
                ? const Center(child: Text("No salary records found."))
                : ListView.builder(
                    padding: const EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 100),
                    itemCount: controller.salaryList.length,
                    itemBuilder: (context, index) {
                      var data = controller.salaryList[index];

                      return Row(
                        children: [
                          Expanded(
                            child: Moneysectioncard(
                              title: data.itemName,
                              date: data.date,
                              amount: data.amount.toString(),
                              isExpense: data.isExpense,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_forever,
                                color: Colors.redAccent),
                            onPressed: () {
                              controller.confirmDelete(data.id, "Salary");
                            },
                          ),
                        ],
                      );
                    },
                  ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: CustomButton(
                text: "Add Salary",
                onTap: () => Get.to(() => AddSalaryPage()),
              ),
            ),
          ],
        );
      }),
    );
  }

}