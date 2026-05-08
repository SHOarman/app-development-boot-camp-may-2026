import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mexpense/presentation/deshbord/widget/balance_card.dart';

import '../money/controller/moneysecation_controller.dart';
import '../money/widget/moneysectioncard.dart';
import '../widget/navigatbutton.dart';

class Deshbord extends StatelessWidget {
  const Deshbord({super.key});

  @override
  Widget build(BuildContext context) {
    final MoneysecationController controller = Get.find();
    return Scaffold(
      bottomNavigationBar: Nev_Button(selectIndex: 0),
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: Colors.black,
        title: Center(

          child: Text(
            "MEXPENSIVE",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),

              //=================================================Deshbord===========================================================
              BalanceCard(),

              //=================================================================other data===============================
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Expenses",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                ],
              ),

              SizedBox(height: 20),

              //======================================expensive========================================
              //==================== Dynamic Expensive Cards ====================
              Obx(() {
                if (controller.expenseList.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("No recent expenses found."),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.expenseList.length,
                  itemBuilder: (context, index) {
                    var data = controller.expenseList[index];

                    
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Moneysectioncard(
                        
                        title: data.itemName,
                        date: data.date,
                        amount: data.amount.toString(), isExpense: data.isExpense,
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
