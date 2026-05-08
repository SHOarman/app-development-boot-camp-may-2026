import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexpense/presentation/money/widget/addexpensivepage.dart';
import 'package:mexpense/presentation/money/widget/moneysectioncard.dart';
import '../widget/custumbutton.dart';
import 'controller/moneysecation_controller.dart';

class Expensive extends StatelessWidget {
  final MoneysecationController controller = Get.find();

  Expensive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            controller.expenseList.isEmpty
                ? const Center(child: Text("No expenses found."))
                : ListView.builder(
                    padding: const EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 100),
                    itemCount: controller.expenseList.length,
                    itemBuilder: (context, index) {
                      var data = controller.expenseList[index];

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
                              controller.confirmDelete(data.id, "Expense");
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
                text: "Add Expense",
                onTap: () => Get.to(() => Addexpensivepage()),
              ),
            ),
          ],
        );
      }),
    );
  }

}