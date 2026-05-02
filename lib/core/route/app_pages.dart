import 'package:get/get.dart';
import 'package:mexpense/presentation/auth/singinpage/singinpage.dart';

import 'app_routes.dart';

class AppPages {

  static const initial = AppRoutes.Singin;
  static final routes = [
    GetPage(name: AppRoutes.Singin, page: ()=>Singinpage()),


  ];



}