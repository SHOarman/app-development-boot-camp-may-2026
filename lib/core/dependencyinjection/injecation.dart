import 'package:get/get.dart';
import 'package:mexpense/presentation/auth/authcontroller/authcontroller.dart';

import '../../presentation/money/controller/moneysecation_controller.dart';
import '../../presentation/profile/controller/profilecontroller.dart';

class DependencyInjection {
  static void bindings() {

    //===============================authsecation===========================================

    Get.put(Authcontroller());
    Get.put(MoneysecationController());
    Get.put(ProfileController());












  }
}