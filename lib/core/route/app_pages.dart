import 'package:get/get.dart';
import 'package:mexpense/presentation/auth/singinpage/singinpage.dart';

import '../../presentation/auth/singup_page/singup_page.dart';
import '../../presentation/deshbord/deshbord.dart';
import '../../presentation/money/money.dart';
import '../../presentation/onloadingscreen/onloadingscreen.dart';
import '../../presentation/profile/profile.dart';
import 'app_routes.dart';

class AppPages {

  static const initial = AppRoutes.onloadingscreen;
  static final routes = [
    GetPage(name: AppRoutes.onloadingscreen, page: ()=>Onloadingscreen()),
    GetPage(name: AppRoutes.Singin, page: ()=>Singinpage()),
    GetPage(name: AppRoutes.singup, page: ()=>SingupPage()),

    //================================homesecation==================================

    GetPage(name: AppRoutes.deshbord, page: ()=>Deshbord()),
    GetPage(name: AppRoutes.profile, page: ()=>Profile()),
    GetPage(name: AppRoutes.money, page: ()=>Money()),







  ];



}