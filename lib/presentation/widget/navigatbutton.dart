import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mexpense/core/route/app_routes.dart';

class Nev_Button extends StatefulWidget {
  const Nev_Button({super.key, this.selectIndex = 0});

  final int selectIndex;

  @override
  State<Nev_Button> createState() => _Nev_ButtonState();
}

class _Nev_ButtonState extends State<Nev_Button> {
  late int myindex;

  @override
  void initState() {
    myindex = widget.selectIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Only 2 items now
    List<String> title = ["Dashboard", 'Money' ,'Profile'];
    List<String> icon = [
      "assetes/icon/home-svgrepo-com.svg",
      'assetes/icon/money-change-svgrepo-com.svg',
      'assetes/icon/profile-2user-svgrepo-com.svg',
    ];

    return Container(
      height: 70, // Slightly reduced height for better look
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 24,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(title.length, (index) {
          bool isSelected = myindex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                myindex = index;
              });

              // Navigation logic
              if (index == 0) {
                Get.toNamed(AppRoutes.deshbord);
              } else if (index == 1) {
                Get.toNamed(AppRoutes.money);
              } else if (index == 2) {
                Get.toNamed(AppRoutes.profile);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF154DA1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(
                    icon[index],
                    height: 24,
                    colorFilter: ColorFilter.mode(
                      isSelected ? Colors.white : Colors.grey,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Text(
                  title[index],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? const Color(0xFF154DA1) : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}