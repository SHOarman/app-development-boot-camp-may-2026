import 'package:flutter/material.dart';
import 'package:mexpense/presentation/money/salary.dart';
import '../widget/navigatbutton.dart';
import 'expensive.dart';

class Money extends StatelessWidget {
  const Money({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          backgroundColor: const Color(0xFF00796B),

          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            tabs: [
              Tab(text: "Salary"),
              Tab(text: "Expensive"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //===========================Salarypagae==============================
           Salary (),
       //=========================================Expensive============================
             Expensive(),
          ],
        ),
        bottomNavigationBar: Nev_Button(selectIndex: 1),
      ),
    );
  }
}